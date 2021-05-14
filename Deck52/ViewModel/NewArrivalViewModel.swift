//
//  NewArrivalViewModel.swift
//  Deck52
//
//  Created by Andres Made on 5/13/21.
//

import SwiftUI
import FirebaseFirestore
import FirebaseStorageSwift

class NewArrivalViewModel: ObservableObject {
    @Published var newArrivalVM = [NewArrivalModel]()
    
    init() {
        fetchNewArrivalData()
    }

    private var db = Firestore.firestore()
    
    func fetchNewArrivalData() {
        db.collection("newItem")
            .addSnapshotListener { (QuerySnapshot, error) in
            guard let documents = QuerySnapshot?.documents else {
                print("No Documents........")
                return
            }
                  self.newArrivalVM = documents.compactMap{(QueryDocumentSnapshot) -> NewArrivalModel? in
                        return try? QueryDocumentSnapshot.data(as: NewArrivalModel.self)
                
               
            }
        }
    }
    
    func delete(at IndexSet: IndexSet) {
        IndexSet.forEach { index in
            let order = newArrivalVM[index]
            db.collection("newItem")
                .document(order.id!)
                .delete{ error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        self.fetchNewArrivalData()
                    }
                }
        }
    }
}
