//
//  StarRatingView.swift
//  animemangatoon
//
//  Created by shashwat singh on 12/10/24.
//

import SwiftUI

struct StarRatingView: View {
    @Binding var rating: Int
       
       // Define the maximum number of stars (usually 5)
       let maxRating = 5
       
       var body: some View {
           VStack (spacing: 0){
               Text("Rate us")
                   .font(.title)
               HStack {
                   // Loop through the number of stars
                   ForEach(1...maxRating, id: \.self) { star in
                       Image(systemName: star <= self.rating ? "star.fill" : "star")
                           .resizable()
                           .frame(width: 40, height: 40)
                           .foregroundColor(star <= self.rating ? Color.yellow : Color.gray)
                           .onTapGesture {
                               // Update the rating based on which star is tapped
                               self.rating = star
                           }
                   }
               }
//               .padding()
               
               // Show the rating as text
               Text("Rating: \(rating)/\(maxRating)")
                   .font(.headline)
                   .padding()
               
               // Save the rating locally (e.g., in UserDefaults)
               Button(action: {
                   UserDefaults.standard.set(self.rating, forKey: "userRating")
                   print("Rating saved: \(self.rating)")
               }) {
                   Text("Save Rating")
                       .padding()
                       .background(Color.blue)
                       .foregroundColor(.white)
                       .cornerRadius(10)
               }
           }
       }
}

#Preview {
    StarRatingView(rating: .constant(0))
}
