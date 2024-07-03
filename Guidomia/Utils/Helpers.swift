//
//  Helpers.swift
//  Guidomia
//
//  Created by Mark Valles on 7/4/24.
//

import Foundation

public func jsonDictionaryFromFile<T>(_ name: String, bundle: Bundle = Bundle.main) throws -> T? {
  guard let path = bundle.path(forResource: name, ofType: "json") else {
    throw AppError.missingResourceFile(name + ".json")
  }
  let data = try Data(contentsOf: URL(fileURLWithPath: path))
  let options = JSONSerialization.ReadingOptions.mutableContainers
  return try JSONSerialization.jsonObject(with: data, options: options) as? T
}
