//
//  TopSellerEditView.swift
//  Deck52
//
//  Created by Andres Made on 5/11/21.
//

import SwiftUI
import Firebase

struct TopSellerEditView: View {
    
    @Environment(\.presentationMode) var mode
    private var db = Firestore.firestore()
    
    @State var topSellerWeek = ""
    @State var one = ""
    @State var two = ""
    @State var three = ""
    @State var four = ""
    @State var five = ""
    @State var six = ""
    @State var seven = ""
    @State var eight = ""
    @State var nine = ""
    @State var ten = ""
    
    var body: some View {
        Form {
            Section{
                TextField("Week", text: $topSellerWeek)
                    .keyboardType(.numberPad)
            }
            
            Section(header: Text("Top 10")) {
                TextField("1", text: $one)
                    .autocapitalization(.allCharacters)
                TextField("2", text: $two)
                    .autocapitalization(.allCharacters)
                TextField("3", text: $three)
                    .autocapitalization(.allCharacters)
                TextField("4", text: $four)
                    .autocapitalization(.allCharacters)
                TextField("5", text: $five)
                    .autocapitalization(.allCharacters)
                TextField("6", text: $six)
                    .autocapitalization(.allCharacters)
                TextField("7", text: $seven)
                    .autocapitalization(.allCharacters)
                TextField("8", text: $eight)
                    .autocapitalization(.allCharacters)
                TextField("9", text: $nine)
                    .autocapitalization(.allCharacters)
                TextField("10", text: $ten)
                    .autocapitalization(.allCharacters)
            }
            Button(action: {
                updateData()
            }, label: {
                Text("Enter")
            })
        }
    }
    func updateData () {
        db.collection("topSellers").document("CeEUmc6D2YeoUqgd8hAD").updateData([
             
            "topSellerWeek": topSellerWeek,
            "one": one,
            "two": two,
            "three": three,
            "four": four,
            "five": five,
            "six": six,
            "seven": seven,
            "eight": eight,
            "nine": nine,
            "ten": ten
            
        ]) { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("UPDATED")
            }
        }
        topSellerWeek = ""
        one = ""
        two = ""
        three = ""
        four = ""
        five = ""
        six = ""
        seven = ""
        eight = ""
        nine = ""
        ten = ""
        
        mode.wrappedValue.dismiss()
    }
}

struct EditTopSellerView_Previews: PreviewProvider {
    static var previews: some View {
        TopSellerEditView()
    }
}
