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
            }
            
            Section(header: Text("Top 10")) {
                TextField("1", text: $one)
                TextField("2", text: $two)
                TextField("3", text: $three)
                TextField("4", text: $four)
                TextField("5", text: $five)
                TextField("6", text: $six)
                TextField("7", text: $seven)
                TextField("8", text: $eight)
                TextField("9", text: $nine)
                TextField("10", text: $ten)
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
