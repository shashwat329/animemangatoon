//
//  SwiftUIView.swift
//  animemangatoon
//
//  Created by shashwat singh on 11/10/24.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTab: String = "All"
    @State private var favorites: [Card] = []
    @State private var cards: [Card] = [
          Card(imageUrl: "https://cdn.pixabay.com/photo/2022/03/10/11/10/venom-7059662_1280.png", title: "Venom : a true symbiote", rating: 0),
          Card(imageUrl: "https://m.media-amazon.com/images/S/pv-target-images/81ef275effa427553a847bc220bebe1dc314b2e79d00333f94a6bcadd7cce851._SX1080_FMjpg_.jpg", title: "Card 2", rating: 0),
          Card(imageUrl: "https://cdn.marvel.com/content/1x/005smp_ons_cut_dsk_01_5.jpg", title: "Card 3", rating: 0),
          Card(imageUrl: "https://static.dc.com/2023-03/dc_superman_hub_4up_Community_1x1.jpg?w=900", title: "Card 4", rating: 0),
          Card(imageUrl: "https://cdn.pixabay.com/photo/2022/03/10/11/10/venom-7059662_1280.png", title: "Card 5", rating: 0)
      ]
    var body: some View {
        ZStack{
        
            VStack{
                TabView {
                           // Home Tab
                    NavigationView {
                          VStack {
                              HStack {
                                  Spacer()
                                  Button(action: {
                                      selectedTab = "All"
                                  }) {
                                      VStack {
                                          Text("All")
                                              .foregroundColor(selectedTab == "All" ? .black : .gray)
                                          
                                          // Underline for the selected tab
                                          Rectangle()
                                              .frame(height: 2)
                                              .foregroundColor(selectedTab == "All" ? .black : .clear)
                                      }
                                  }
                                  
                                  Spacer()
                                  
                                  // "Recommendation" Navigation Link
                                  Button(action: {
                                      selectedTab = "Recommendation"
                                  }) {
                                      VStack {
                                          Text("Recommendation")
                                              .foregroundColor(selectedTab == "Recommendation" ? .black : .gray)
                                          
                                          // Underline for the selected tab
                                          Rectangle()
                                              .frame(height: 2)
                                              .foregroundColor(selectedTab == "Recommendation" ? .black : .clear)
                                      }
                                  }
                                  
                                  Spacer()
                              }
                              .padding(.top, 16)
                              .background(Color.white)
                              
                              Spacer()
                              
                              // Main content based on selected tab
                              if selectedTab == "All" {
                                  BoxView(cards: $cards,favorites:$favorites)
                              } else {
                                  Text("Showing Recommendations")
                                      .font(.largeTitle)
                                      .padding()
                              }
                              
                              Spacer()
                          }
                          .navigationBarTitleDisplayMode(.inline)
                      }
                               .tabItem {
                                   Image(systemName: "house")
                                   Text("Home")
                               }

                           // Search Tab
                           Text("Search Screen")
                               .tabItem {
                                   Image(systemName: "magnifyingglass")
                                   Text("Search")
                               }

                           // Favorite Tab
                    FavoriteView(favorites: $favorites)
                               .tabItem {
                                   Image(systemName: "heart")
                                   Text("Favorite")
                               }

                           // Profile Tab
                           Text("Profile Screen")
                               .tabItem {
                                   Image(systemName: "person")
                                   Text("Profile")
                               }
                       }
                       .accentColor(.blue)
                
            }
        }
    }
}

#Preview {
    HomeView()
}
