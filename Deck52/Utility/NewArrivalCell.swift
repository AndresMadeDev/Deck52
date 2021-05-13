//
//  NewArrivalCardView.swift
//  Deck52
//
//  Created by Andres Made on 5/13/21.
//

import SwiftUI
import Kingfisher

struct NewArrivalCell: View {
    
    let title: String
    let imgeUrl: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .bold()
                    .font(.title3)
                    .padding()
                    
                Spacer()
            }
                KFImage(URL(string: imgeUrl))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height: 300)
        }

    }
}
