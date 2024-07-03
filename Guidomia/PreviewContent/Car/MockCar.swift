//
//  MockCar.swift
//  Guidomia
//
//  Created by Mark Valles on 7/4/24.
//

import Foundation

extension Car {
  static let mockBmw3300i = try! Car.decode([
    "id": 3,
    "consList": [
      "You can heard the engine over children cry at the back",
      "",
      "You may lose this one if you divorce"
    ],
    "customerPrice": 65000.0,
    "make": "BMW",
    "marketPrice": 55900.0,
    "model": "3300i",
    "prosList": [
      "Your average business man car",
      "Can bring the family home safely",
      "The city must have"
    ],
    "rating": 5
  ])
}
