//
//  NewArrivalCardView.swift
//  Deck52
//
//  Created by Andres Made on 5/13/21.
//

import SwiftUI
import Kingfisher
import SDWebImageSwiftUI

struct NewArrivalCell: View {
    
    let title: String
    let imgeUrl: String
    
    
    var body: some View {
        VStack {
            VStack(spacing: 5) {
                HStack {
                    Text(title)
                        .bold()
                        .font(.title3)
                        .padding(.leading)
                    
                    Spacer()
                }
                
                
                KFImage(URL(string: imgeUrl))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
            }.padding(.vertical)
        }
    }
}
