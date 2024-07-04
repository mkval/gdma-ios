//
//  SomeButton.swift
//  Guidomia
//
//  Created by Mark Valles on 7/4/24.
//

import SwiftUI

struct SomeButton: View {
  var action: () -> Void
  var text: String
  var alignment: Alignment = .center
  
  var body: some View {
    Button(action: self.action, label: {
      Text(self.text)
        .font(.system(size: 17, weight: .semibold))
        .frame(maxWidth: .infinity, alignment: alignment)
        .padding(.horizontal, 20)
        .padding(.vertical, 8)
        .contentShape(Rectangle())
        .background(.white)
        .foregroundColor(.primaryDarkGray)
        .cornerRadius(10)
    })
    .buttonStyle(.plain)
    .shadow(color: .black.opacity(0.12), radius: 2, x: 0, y: 4)
  }
}

#Preview {
  VStack {
    SomeButton(action: {}, text: "Some button")
  }
  .padding(20)
  .background(.primaryLightGray)
}
