//
//  FavoriteView.swift
//  animemangatoon
//
//  Created by shashwat singh on 12/10/24.
//
import SwiftUI
struct FavoriteView: View {
    @Binding var favorites: [Card]

    var body: some View {
        NavigationView {
            ScrollView {
                if favorites.isEmpty {
                    Text("No favorites added yet.")
                        .font(.headline)
                        .padding()
                } else {
                    LazyVStack {
                        ForEach(favorites) { card in
                            CardView(card: card, rating: .constant(card.rating), isFavorite: .constant(true))
                                .padding()
                        }
                    }
                }
            }
            .navigationTitle("Favorite Cards")
        }
    }
}

