//
//  Store52ViewModel.swift
//  Deck52
//
//  Created by Andres Made on 5/11/21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift



class Store52ViewModel: ObservableObject {
    @Published var deck52Model = [Store52Model]()
    
    private var db = Firestore.firestore()
    
    func fetchKPIData() {
        db.collection("store52").addSnapshotListener { (QuerySnapshot, error) in
            guard let documents = QuerySnapshot?.documents else {
                print("No Documents........")
                return
            }

            self.deck52Model = documents.compactMap{(QueryDocumentSnapshot) -> Store52Model? in
                return try? QueryDocumentSnapshot.data(as: Store52Model.self)
            }
        }
    }
}
