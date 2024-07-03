//
//  Car.swift
//  Guidomia
//
//  Created by Mark Valles on 7/4/24.
//

import Foundation

struct Car: BaseModel, Decodable, Identifiable {
  let id: Int
  let make: CarMake
  let model: CarModel
  
  let customerPrice: Double
  let marketPrice: Double
  
  let rating: Int
  
  let pros: [String]
  let cons: [String]
  
  enum CodingKeys: String, CodingKey {
    case id,
         make,
         model,
         customerPrice,
         marketPrice,
         rating,
         prosList,
         consList
  }
    
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.id = try container.decode(Int.self, forKey: .id)
    self.make = try container.decode(CarMake.self, forKey: .make)
    self.model = try container.decode(CarModel.self, forKey: .model)
    self.customerPrice = try container.decode(Double.self, forKey: .customerPrice)
    self.marketPrice = try container.decode(Double.self, forKey: .marketPrice)
    self.rating = try container.decode(Int.self, forKey: .rating)
    self.pros = try container.decode([String].self, forKey: .prosList)
    self.cons = try container.decode([String].self, forKey: .consList)
  }
}
