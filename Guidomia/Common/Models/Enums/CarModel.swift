//
//  CarModel.swift
//  Guidomia
//
//  Created by Mark Valles on 7/4/24.
//

import Foundation

enum CarModel: String, Decodable, CaseIterable {
  case rangeRover = "Range Rover"
  case roadster = "Roadster"
  case bmw3300i = "3300i"
  case gleCoupe =  "GLE Coupe"
  
  var name: String {
    self.rawValue
  }
}
