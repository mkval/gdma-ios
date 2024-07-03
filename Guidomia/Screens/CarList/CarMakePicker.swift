//
//  CarMakePicker.swift
//  Guidomia
//
//  Created by Mark Valles on 7/4/24.
//

import SwiftUI

struct CarMakePicker: View {
  static let anyMake = "Any model"
  
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
      Picker("Car Make", selection: self.$selectedMake) {
        ForEach(self.carMakes, id: \.self) {
          Text($0)
        }
      }
      .pickerStyle(.wheel)
    }
    .onChange(of: self.selectedMake) { _, newValue in
      self.onChange(newValue)
    }
  }
}

#Preview {
  CarMakePicker(selected: CarMakePicker.anyMake, onChange: { make in
    
  })
}
