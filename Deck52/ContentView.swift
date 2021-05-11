//
//  ContentView.swift
//  Deck52
//
//  Created by Andres Made on 5/10/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthVM
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                SignInView()
            } else {
                HomeView()
            }
           
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
