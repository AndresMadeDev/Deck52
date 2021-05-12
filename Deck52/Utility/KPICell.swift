//
//  KPICell.swift
//  Deck52
//
//  Created by Andres Made on 5/12/21.
//

import SwiftUI

struct KPICell: View {
    
     var title: String
     var subtitle: String
     var cellColor: Color
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Text(title)
                    .bold()
                    .font(.title)
                    .minimumScaleFactor(0.50)
                Text(subtitle)
                    .fontWeight(.semibold)
                    .font(.title)
                    .minimumScaleFactor(0.50)
                    .lineLimit(1)
            }
            
            Spacer()
        }
        .padding()
        .frame(height: 100)
        .background(cellColor)
        .foregroundColor(.white)
        .cornerRadius(15)
    }
}
