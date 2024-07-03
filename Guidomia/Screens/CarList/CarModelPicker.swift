//
//  CarModelPicker.swift
//  Guidomia
//
//  Created by Mark Valles on 7/4/24.
//

import SwiftUI

struct CarModelPicker: View {
  static let anyModel = "Any model"
  
  @State var selectedModel: String = CarModelPicker.anyModel
  
  var onChange: ((String) -> Void)
  
  private let make: CarMake
  
  init(make: CarMake, onChange: @escaping (String) -> Void) {
    self.make = make
    self.onChange = onChange
  }
  
  private var models: [String] {
    switch self.make {
    case .alpine:
      return [CarModelPicker.anyModel, CarModel.roadster.rawValue]
    case .bmw:
      return [CarModelPicker.anyModel, CarModel.bmw3300i.rawValue]
    case .landRover:
      return [CarModelPicker.anyModel, CarModel.rangeRover.rawValue]
    case .mercedesBenz:
      return [CarModelPicker.anyModel, CarModel.gleCoupe.rawValue]
    }
  }
  
  var body: some View {
    VStack {
      Picker("Car Model", selection: self.$selectedModel) {
        ForEach(self.models, id: \.self) {
          Text($0)
        }
      }
      .pickerStyle(.wheel)
    }
    .onChange(of: self.selectedModel) { _, newValue in
      self.onChange(newValue)
    }
  }
}

#Preview {
  CarModelPicker(make: .alpine, onChange: { model in
    
  })
}
