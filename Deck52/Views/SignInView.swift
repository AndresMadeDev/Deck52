//
//  SignInView.swift
//  Deck52
//
//  Created by Andres Made on 5/10/21.
//

import SwiftUI

struct SignInView: View {
    
    @EnvironmentObject var viewModel: AuthVM
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)), Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)), Color(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)) ]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 75) {
                
                Text("Deck 52")
                    .font(.system(size: 50, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .opacity(0.8)
                    .padding(.top, 100)
                
                VStack(spacing: 25) {
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .keyboardType(.emailAddress)
                    
                    CustomSecureField(text: $password, placeholder: Text("Password"))
                }.padding(.horizontal, 20)
                
                    Button(action: {
                        viewModel.login(withEmail: email, withPassword: password)
                    }, label: {
                    Text("Sign In")
                        .font(.system(size: 25, weight: .bold))
                        .frame(width: 325, height: 50)
                        .foregroundColor(.white)
                        .background(Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)))
                        .cornerRadius(20)
                })
                Spacer()
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
