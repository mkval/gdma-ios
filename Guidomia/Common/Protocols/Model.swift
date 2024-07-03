//
//  Model.swift
//  Guidomia
//
//  Created by Mark Valles on 7/4/24.
//

import Foundation

protocol Model {
  static func decoder() -> JSONDecoder
  static func encoder() -> JSONEncoder
}

// MARK: - Decodable

extension Model where Self: Decodable {
  
  static func decoder() -> JSONDecoder {
    JSONDecoder()
  }
  
  static func decode(_ data: Data) throws -> Self {
    try decoder().decode(self, from: data)
  }
  
  static func decode(_ dictionary: [String: Any]) throws -> Self {
    try decode(try JSONSerialization.data(withJSONObject: dictionary))
  }
}

// MARK: - Encodable

extension Model where Self: Encodable {
  
  static func encoder() -> JSONEncoder {
    JSONEncoder()
  }
  
  func encode() throws -> Data {
    try Self.encoder().encode(self)
  }
  
  func dictionary() -> [String: Any]? {
    do {
      if let dict = try JSONSerialization.jsonObject(
        with: try encode(),
        options: .allowFragments
      ) as? [String: Any] {
        return dict.filter { !($0.value is NSNull) }
      }
    } catch {
      print(error)
    }
    return nil
  }
  
  func json(formatting: JSONEncoder.OutputFormatting = []) -> String? {
    do {
      let encoder = Self.encoder()
      encoder.outputFormatting = formatting
      
      return String(data: try encoder.encode(self), encoding: .utf8)
      
    } catch {
      print(error)
      return nil
    }
  }
}

// MARK: - BaseModel

protocol BaseModel: Model {}

extension BaseModel {
  
  static func decoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    // decoder.keyDecodingStrategy = .convertFromSnakeCase
    return decoder
  }
  
  static func encoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    // encoder.keyEncodingStrategy = .convertToSnakeCase
    return encoder
  }
}
