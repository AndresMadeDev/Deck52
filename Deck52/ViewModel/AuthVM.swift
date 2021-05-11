//
//  AuthVM.swift
//  Deck52
//
//  Created by Andres Made on 5/10/21.
//

import SwiftUI
import Firebase

class AuthVM: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthVM()
    
    init(){
        userSession = Auth.auth().currentUser
    }
    
    
    func login(withEmail email: String, withPassword password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error{
                print("DEBUG: Login Failed\(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            self.userSession = user
            print("Sucsess Logged in.......")
        }
    }
    
    func signOut(){
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    
}
