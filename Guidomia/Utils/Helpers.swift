//
//  Helpers.swift
//  Guidomia
//
//  Created by Mark Valles on 7/4/24.
//

import Foundation

public func jsonDictionaryFromFile(_ name: String, bundle: Bundle = Bundle.main) throws -> JSONDictionary {
  guard let path = bundle.path(forResource: name, ofType: "json") else {
    fatalError("File \(name).json could not be located.")
  }
  let data = try Data(contentsOf: URL(fileURLWithPath: path))
  let options = JSONSerialization.ReadingOptions.mutableContainers
  
  guard let dictionary = try JSONSerialization.jsonObject(with: data, options: options) as? JSONDictionary else {
    return [:]
  }
  return dictionary
}
