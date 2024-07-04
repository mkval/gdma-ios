//
//  CarMakePicker.swift
//  Guidomia
//
//  Created by Mark Valles on 7/4/24.
//

import SwiftUI

struct CarMakePicker: View {
  static let anyMake = "Any model"
  
  @Environment(\.dismiss) var dismiss
  @State var selectedMake: String = ""
  
  var onChange: ((String) -> Void)
  
  private let carMakes: [String]
  
  init(selected: String, onChange: @escaping (String) -> Void) {
    self._selectedMake = State(initialValue: selected)
    self.onChange = onChange
    self.carMakes = [CarMakePicker.anyMake] + CarMake.allCases.map { $0.name }
  }
  
  var body: some View {
    VStack {
      Spacer().frame(height: 30)
      
      Picker("Car Make", selection: self.$selectedMake) {
        ForEach(self.carMakes, id: \.self) {
          Text($0)
        }
      }
      .pickerStyle(.wheel)
      //.frame(minHeight: 150)
      
      HStack {
        SomeButton(action: {
          self.onChange(self.selectedMake)
          self.dismiss()
        }, text: "Done")
        .padding(20)
      }
      .background(.primaryLightGray)
    }
    .onChange(of: self.selectedMake) { _, newValue in
      self.onChange(newValue)
    }
  }
}

#Preview {
  VStack {
    CarMakePicker(selected: CarMakePicker.anyMake, onChange: { _ in })
  }
}
