//
//  CarMake.swift
//  Guidomia
//
//  Created by Mark Valles on 7/4/24.
//

import Foundation

enum CarMake: String, Decodable, CaseIterable {
  case alpine = "Alpine"
  case bmw = "BMW"
  case landRover = "Land Rover"
  case mercedesBenz = "Mercedes Benz"
  
  var name: String {
    self.rawValue
  }
}
