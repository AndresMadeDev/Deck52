//
//  HomeView.swift
//  Deck52
//
//  Created by Andres Made on 5/10/21.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var viewModel: AuthVM
    
    var body: some View {
        
        Text("Home view")
        
        Button(action: {
            viewModel.signOut()
        }, label: {
            Text("Sign Out")
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
