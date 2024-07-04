//
//  Double+Extensions.swift
//  Guidomia
//
//  Created by Mark Valles on 7/4/24.
//

import Foundation

extension Double {
  
  /// Ref: https://stackoverflow.com/a/51602494/425694
  ///
  var shortStringRepresentation: String {
    if self.isNaN {
      return "NaN"
    }
    
    if self.isInfinite {
      return "\(self < 0.0 ? "-" : "+")Infinity"
    }
    
    let units = ["", "k", "M"]
    var interval = self
    var index = 0
    
    while index < units.count - 1 {
      if abs(interval) < 1000.0 {
        break
      }
      index += 1
      interval /= 1000.0
    }
    
    return "\(String(format: "%0.*g", Int(log10(abs(interval))) + 2, interval))\(units[index])"
  }
}
