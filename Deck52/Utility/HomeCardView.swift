//
//  HomeCardView.swift
//  Deck52
//
//  Created by Andres Made on 5/11/21.
//

import SwiftUI

struct HomeCardView: View {
    
    var title: String
    var cardColor: UIColor
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                Spacer()
            }
            Spacer()
        }
        .frame(height: 125)
        .background(Color(cardColor))
        .cornerRadius(20)
            }
}

struct HomeCardView_Previews: PreviewProvider {
    static var previews: some View {
        HomeCardView(title: "New Arrival", cardColor: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
    }
}
