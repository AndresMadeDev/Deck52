//
//  ManagerHomeView.swift
//  Deck52
//
//  Created by Andres Made on 5/11/21.
//

import SwiftUI

struct ManagerHomeView: View {
    @State var signOutManagerView = false
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
            }
            .navigationTitle("Manager")
            .navigationBarItems(trailing: Button(action: {
                signOutManagerView = true
            }, label: {
                Image(systemName: "xmark.circle")
                    .font(.subheadline)
                    .foregroundColor(.red)
            }).fullScreenCover(isPresented: $signOutManagerView, content: HomeView.init))
           
        }
    }
}

struct ManagerHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ManagerHomeView()
    }
}
