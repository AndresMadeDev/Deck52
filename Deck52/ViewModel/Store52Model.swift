//
//  Store52Model.swift
//  Deck52
//
//  Created by Andres Made on 5/11/21.
//

import Firebase
import FirebaseFirestoreSwift


struct NewArrivalModel: Identifiable, Codable {
    @DocumentID var id: String? = UUID().uuidString
    let itemName: String
    let imageURL: String
    
}


struct KPIModel: Identifiable, Codable {
    @DocumentID var id: String? = UUID().uuidString
    var sales: String
    var traffic: String
    var ads: String
    var upt: String
    var conv: String
    var kpiWeek: String
}

struct TopSellersModel: Identifiable, Codable {
    @DocumentID var id: String? = UUID().uuidString
    var topSellerWeek: String
    var one: String
    var two: String
    var three: String
    var four: String
    var five: String
    var six: String
    var seven: String
    var eight: String
    var nine: String
    var ten: String
}
