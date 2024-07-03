//
//  AppError.swift
//  Guidomia
//
//  Created by Mark Valles on 7/4/24.
//

import Foundation

enum AppError: Error, LocalizedError {
  case missingResourceFile(String)
  
  var errorDescription: String? {
    switch self {
    case .missingResourceFile(let name):
      return "File named \(name) could not be located."
    }
  }
}
