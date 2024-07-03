//
//  CarListItemViewModel.swift
//  Guidomia
//
//  Created by Mark Valles on 7/4/24.
//

import Foundation

protocol CarListItemViewModelProtocol: ObservableObject {
  var name: String? { get }
  var imageAsset: ImageAsset? { get }
  var price: String { get }
  var rating: UInt { get }
  var pros: [String] { get }
  var cons: [String] { get }
  
  var isSelected: Bool { get set }
}

final class CarListItemViewModel: CarListItemViewModelProtocol {
  
  @Published var isSelected = false
  
  private let car: Car
  
  init(car: Car, isSelected: Bool = false) {
    self.car = car
    self.isSelected = isSelected
  }
}

extension CarListItemViewModel: Identifiable {
  var id: Int {
    self.car.id
  }
}

extension CarListItemViewModel {
  
  var name: String? {
    switch (self.car.make, self.car.model) {
    case (CarMake.alpine, CarModel.roadster):
      return CarMake.alpine.name + " " + CarModel.roadster.name
    case (CarMake.bmw, CarModel.bmw3300i):
      return CarMake.bmw.name + " " + CarModel.bmw3300i.name
    case (CarMake.landRover, CarModel.rangeRover):
      return CarModel.rangeRover.name
    case (CarMake.mercedesBenz, CarModel.gleCoupe):
      return CarMake.mercedesBenz.name
    default:
      return nil
    }
  }
  
  var imageAsset: ImageAsset? {
    switch (self.car.make, self.car.model) {
    case (CarMake.alpine, CarModel.roadster):
      return Assets.Images.CarImages.alpineRoadster
    case (CarMake.bmw, CarModel.bmw3300i):
      return Assets.Images.CarImages.bmw330i
    case (CarMake.landRover, CarModel.rangeRover):
      return Assets.Images.CarImages.rangeRover
    case (CarMake.mercedesBenz, CarModel.gleCoupe):
      return Assets.Images.CarImages.mercedezBenzGlc
    default:
      return nil
    }
  }
  
  var price: String {
    self.car.marketPrice.shortStringRepresentation
  }
  
  var rating: UInt {
    UInt(self.car.rating)
  }
  
  var pros: [String] {
    self.car.pros.filter { !$0.isEmpty }
  }
  
  var cons: [String] {
    self.car.cons.filter { !$0.isEmpty }
  }
}
