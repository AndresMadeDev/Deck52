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
        ScrollView(.vertical) {
            LazyVStack(spacing: 10) {
                ForEach(viewModel.newArrivalVM) { item in
                        NewArrivalCell(title: item.itemName, imgeUrl: item.imageURL)
                }
            }.padding(.top, 30)
        }
        .navigationTitle("New Arrivel")
    }
}

struct NewArrivalView_Previews: PreviewProvider {
    static var previews: some View {
        NewArrivalView()
    }
}
