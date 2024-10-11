//
//  SwiftUIView.swift
//  animemangatoon
//
//  Created by shashwat singh on 11/10/24.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTab: String = "All"
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
                                  BoxView()
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
                           Text("Favorite Screen")
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
