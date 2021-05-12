//
//  TopSellersView.swift
//  Deck52
//
//  Created by Andres Made on 5/11/21.
//

import SwiftUI

struct TopSellersView: View {
    
    @ObservedObject private var viewModel = TopSellerModel()
    
    var body: some View {
        List(viewModel.topSeller) { item in
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            HStack {
                                Spacer()
                                Text("Week \(item.topSellerWeek) Top Seller")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .padding()
                                Spacer()
                            }
                            .background(Color.white.opacity(0.3))
                            .cornerRadius(20)
                           
                            
                            HStack {
                                VStack(alignment:.leading ,spacing: 20) {
                                    Text("1:  \(item.one)")
                                    Text("2:  \(item.two)")
                                    Text("3:  \(item.three)")
                                    Text("4:  \(item.four)")
                                    Text("5:  \(item.five)")
                                    Text("6:  \(item.six)")
                                    Text("7:  \(item.seven)")
                                    Text("8:  \(item.eight)")
                                    Text("9:  \(item.nine)")
                                    Text("10: \(item.ten)")
                                }
                                .font(.title3)
                                .padding(.top)
                                .padding(.leading)
                                .multilineTextAlignment(.leading)
                                .lineLimit(2)
                                
                                Spacer()
                            }
                        }
                        .padding(.vertical)
                        .padding(.horizontal)
                        
                        Spacer()
                    }
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(30)
                }
            Spacer()
        }
        .navigationTitle("Top Seller")
        .onAppear{
            
            viewModel.fetchTopSellerData()
        }
        
        
    }
}

struct TopSellerView_Previews: PreviewProvider {
    static var previews: some View {
        TopSellersView()
            .preferredColorScheme(.dark)
    }
}
