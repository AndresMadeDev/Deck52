//
//  KPIViewModel.swift
//  Deck52
//
//  Created by Andres Made on 5/12/21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift



class KPI: ObservableObject {
    @Published var kpi = [KPIModel]()
    
    private var db = Firestore.firestore()
    
    func fetchKPIData() {
        db.collection("kpi").addSnapshotListener { (QuerySnapshot, error) in
            guard let documents = QuerySnapshot?.documents else {
                print("No Documents........")
                return
            }
            DispatchQueue.main.async {
                self.kpi = documents.compactMap{(QueryDocumentSnapshot) -> KPIModel? in
                    return try? QueryDocumentSnapshot.data(as: KPIModel.self)
                }
            }
        }
    }
}
