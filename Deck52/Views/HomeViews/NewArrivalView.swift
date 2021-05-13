//
//  NewArrivalView.swift
//  Deck52
//
//  Created by Andres Made on 5/11/21.
//

import SwiftUI

struct NewArrivalView: View {
    @ObservedObject private var viewModel = NewArrivalViewModel()
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 32) {
                ForEach(viewModel.newArrivalVM) { item in
                    NewArrivalCell(title: item.itemName, imgeUrl: item.imageURL)
                }
            }.navigationTitle("New Arrivel")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear{
                self.viewModel.fetchNewArrivalData()
        }
        }
    }
}

struct NewArrivalView_Previews: PreviewProvider {
    static var previews: some View {
        NewArrivalView()
    }
}
