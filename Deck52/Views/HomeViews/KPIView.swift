//
//  KPIView.swift
//  Deck52
//
//  Created by Andres Made on 5/11/21.
//

import SwiftUI

struct KPIView: View {
    @ObservedObject private var viewModel = KPI()
    
    var body: some View {
        List(viewModel.kpi) { item in
            VStack {
                Text("Week \(item.kpiWeek)")
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .padding(.bottom)
                    .padding(.top, 20)
                
                
                KPICell(title: "Sales", subtitle: "$\(item.sales)", cellColor: Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)))
                
                
                HStack {
                    KPICell(title: "Conv", subtitle: "\(item.conv)%", cellColor: Color(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)))
                    KPICell(title: "UPT", subtitle: item.upt, cellColor: Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)))
                    KPICell(title: "ADS", subtitle: "$\(item.ads)", cellColor: Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)))
                }
                KPICell(title: "Traffic", subtitle: item.traffic, cellColor: Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)))
                
                Spacer()
            }
            .padding(.horizontal, 10)
            .navigationTitle("KPI")
            
        }
        .onAppear{
            self.viewModel.fetchKPIData()
        }
    }
}

struct KPIView_Previews: PreviewProvider {
    static var previews: some View {
        KPIView()
    }
}
