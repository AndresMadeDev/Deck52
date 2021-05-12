//
//  KPIEditView.swift
//  Deck52
//
//  Created by Andres Made on 5/11/21.
//

import SwiftUI
import Firebase

struct KPIEditView: View {
    
    @Environment(\.presentationMode) var mode
    private var db = Firestore.firestore()
    
    @State var week = ""
    @State var sales = ""
    @State var traffic = ""
    @State var conv = ""
    @State var ads = ""
    @State var upt = ""
    
    var body: some View {
        Form {
            Section(header: Text("KPI")) {
                TextField("Week", text: $week)
                    .keyboardType(.numberPad)
                TextField("Sales", text: $sales)
                    .keyboardType(.numbersAndPunctuation)
                TextField("Traffic", text: $traffic)
                    .keyboardType(.numberPad)
                TextField("Conversion", text: $conv)
                    .keyboardType(.numbersAndPunctuation)
                TextField("ADS", text: $ads)
                    .keyboardType(.numbersAndPunctuation)
                TextField("UPT", text: $upt)
                    .keyboardType(.numbersAndPunctuation)
            }
            Section {
                Button("Enter", action: {
                    mode.wrappedValue.dismiss()
                    addKPI()
                })
            }
        }.navigationTitle("KPI")
    }
    func addKPI(){
        db.collection("kpi")
            .document("fPezUTOEt4xg5tm8p0TM")
            .updateData([
                "kpiWeek": week,
                "sales": sales,
                "traffic": traffic,
                "conv": conv,
                "ads": ads,
                "upt": upt,
            ]) { error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    print ("UPDATED!!!")
                }
                week = ""
                sales = ""
                traffic = ""
                conv = ""
                upt = ""
                ads = ""
            }
    }
}

struct KPIEditView_Previews: PreviewProvider {
    static var previews: some View {
        KPIEditView()
    }
}
