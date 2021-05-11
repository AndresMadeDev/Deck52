//
//  Deck52App.swift
//  Deck52
//
//  Created by Andres Made on 5/10/21.
//

import SwiftUI
import Firebase

@main
struct Deck52App: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthVM.shared)
        }
    }
}
