//
//  RatingView.swift
//  Guidomia
//
//  Created by Mark Valles on 7/4/24.
//

import SwiftUI

struct RatingView: View {
  var maxRating: UInt = 5
  var rating: UInt = 3
  var starSize: CGFloat = 30
  var spacing: CGFloat = 0
  
  var body: some View {
    HStack(alignment: .center, spacing: spacing) {
      ForEach((0..<maxRating), id: \.self) { value in
        if value + 1 <= rating {
          Image(systemName: "star.fill")
            .font(.system(size: self.starSize))
            .foregroundColor(.primaryOrange)
        } else {
          Image(systemName: "star")
            .font(.system(size: self.starSize))
            .foregroundColor(.primaryOrange)
        }
      }
      
      Spacer()
    }
    .frame(maxWidth: .infinity)
  }
}

#Preview {
  RatingView(
    maxRating: 5,
    rating: 2,
    starSize: 15,
    spacing: 4
  )
}
