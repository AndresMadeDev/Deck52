//
//  TopSellersViewModel.swift
//  Deck52
//
//  Created by Andres Made on 5/12/21.
//

import Foundation
import FirebaseFirestore
import FirebaseStorageSwift

class TopSellerModel: ObservableObject{
    @Published var topSeller = [TopSellersModel]()
    
    private var db = Firestore.firestore()
    
    func fetchTopSellerData() {
        db.collection("topSellers").addSnapshotListener { (QuerySnapshot, error) in
            guard let documents = QuerySnapshot?.documents else {
                print("No Documents........")
                return
            }
            DispatchQueue.main.async {
                self.topSeller = documents.compactMap{(QueryDocumentSnapshot) -> TopSellersModel? in
                    return try? QueryDocumentSnapshot.data(as: TopSellersModel.self)
                }
            }
        }
    }
}
