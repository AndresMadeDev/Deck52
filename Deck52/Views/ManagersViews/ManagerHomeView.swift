//
//  ManagerHomeView.swift
//  Deck52
//
//  Created by Andres Made on 5/11/21.
//

import SwiftUI

struct ManagerHomeView: View {
    var body: some View {
        NavigationView {
            Form {
                Section {
                    NavigationLink("KPI", destination: KPIEditView())
                }
                Section {
                    NavigationLink("New Arrival", destination: NewArrivalEditView())
                }
                Section {
                    NavigationLink("Top Seller", destination: TopSellerEditView())
                }
            }.navigationTitle("Manager")
           
        }
    }
}

struct ManagerHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ManagerHomeView()
    }
}
