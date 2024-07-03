//
//  CarListViewModel.swift
//  Guidomia
//
//  Created by Mark Valles on 7/4/24.
//

import Foundation

protocol CarListViewModelProtocol: ObservableObject {
  
  var bannerTitle: String { get }
  var bannerSubtitle: String { get }
  
  var itemViewModels: [CarListItemViewModel] { get }
}

final class CarListViewModel: CarListViewModelProtocol {
  
  let bannerTitle: String
  let bannerSubtitle: String
  
  let itemViewModels: [CarListItemViewModel]
  
  init() {
    self.bannerTitle = "Tacoma 2021"
    self.bannerSubtitle = "Get your's now"
    
    do {
      let array: [JSONDictionary] = try jsonDictionaryFromFile("car_list") ?? []
      self.itemViewModels = try array.map { try Car.decode($0) }
        .sorted(by: { $0.marketPrice > $1.marketPrice })
        .map { CarListItemViewModel(car: $0) }
      
    } catch {
      print("Failed loading car list from json file")
      self.itemViewModels = []
    }
  }
  
}
