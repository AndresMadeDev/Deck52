//
//  AuthManager.swift
//  Deck52
//
//  Created by Andres Made on 5/12/21.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct AuthManagerView: View {
    
    @State private var password = ""
    var setPassword = "123123"
    @State private var showNextView = false
    @Environment(\.presentationMode) var mode
    
    var body: some View {
            
            VStack {
                CustomSecureField(text: $password, placeholder: Text("Password"))
                    .keyboardType(.numberPad)
                    .padding()
                
                
                Button(action: {
                    if password == setPassword{
                        print("Sucsessful")
                        showNextView.toggle()
                    } else {
                        print("Not sucsessful")
                    }
                }) {
                    Text("Enter Password")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(20)
                }.fullScreenCover(isPresented: $showNextView, content: ManagerHomeView.init)
                .padding(20)
            }
            .background(BlurView(style: .systemChromeMaterialDark))
            .cornerRadius(20)
            .edgesIgnoringSafeArea(.all)
            .padding(30)
    }
}



