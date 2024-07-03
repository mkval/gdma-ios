//
//  ListFilterButton.swift
//  Guidomia
//
//  Created by Mark Valles on 7/4/24.
//

import SwiftUI

struct ListFilterButton: View {
  
  var action: () -> Void
  var text: String
  
  var body: some View {
    Button(action: self.action, label: {
      Text(self.text)
        .font(.system(size: 17, weight: .semibold))
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 20)
        .padding(.vertical, 8)
        .contentShape(Rectangle())
        .background(.white)
        .foregroundColor(.primaryDarkGray)
        .cornerRadius(10)
    })
    .buttonStyle(.plain)
    .shadow(color: .black.opacity(0.12), radius: 4, x: 0, y: 6)
    .shadow(color: .black.opacity(0.12), radius: 2, x: 0, y: 4)
    .shadow(color: .black.opacity(0.12), radius: 0, x: 0, y: 1)
  }
}

#Preview {
  VStack {
    ListFilterButton(action: {}, text: "Some button")
  }
  .padding(20)
  .background(.primaryLightGray)
}
