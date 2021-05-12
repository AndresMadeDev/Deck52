//
//  HomeView.swift
//  Deck52
//
//  Created by Andres Made on 5/10/21.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var viewModel: AuthVM
    @State var showAuth = false
    
    var body: some View {
        NavigationView {
           
                ZStack {
                    VStack {
                        Text("Deck52")
                            .foregroundColor(.primary)
                            .opacity(0.5)
                            .font(.system(size: 50, weight: .bold))
                            .padding(.top, 30)
                            .onTapGesture(count: 3) {
                                withAnimation(.spring()){
                                    showAuth = true
                                }
                            }
                        
                        LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: 10), count: 1), spacing: 20) {
                            NavigationLink(
                                destination: NewArrivalView(),
                                label: {
                                    HomeCardView(title: "New Arrival", cardColor: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
                                })
                            NavigationLink(
                                destination: KPIView(),
                                label: {
                                    HomeCardView(title: "KPI", cardColor: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
                                })
                            NavigationLink(
                                destination: TopSellersView(),
                                label: {
                                    HomeCardView(title: "Top Seller", cardColor: #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1))
                                })
                            Link(destination: URL(string: "https://www.ugg.com")!, label: {
                                HomeCardView(title: "UGG.com", cardColor: #colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1))
                            })
                        }
                
                        Spacer()
                        
                        Button(action: {
                            viewModel.signOut()
                        }, label: {
                            Text("Sign Out")
                        })
                        Spacer()
                    }
                    .padding()
                    .navigationBarHidden(true)
                    
                    if showAuth {
                        ZStack {
                            BlurView(style: .systemThinMaterial)
                                .onTapGesture {
                                    withAnimation(.easeIn){
                                        showAuth = false
                                    }
                                }
                            VStack {
                                Spacer()
                                ManagerView()
                                Spacer()
                                
                                Image(systemName: "xmark.circle")
                                    .foregroundColor(.gray)
                                    .font(.title)
                                    .padding(.bottom, 125)
                                    
                            }
                        }
                        .transition(.move(edge: .top))
                        .zIndex(1)
                    }
                }
            }
        }
    }


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
