//
//  CarListViewModel.swift
//  Guidomia
//
//  Created by Mark Valles on 7/4/24.
//

import Foundation
import Combine

protocol CarListViewModelProtocol: ObservableObject {
  
  var bannerTitle: String { get }
  var bannerSubtitle: String { get }
  
  var filterdViewModels: [CarListItemViewModel] { get }
  
  var selectedCarMake: CarMake? { get set }
  
  var selectedCarModel: CarModel? { get set }
}

final class CarListViewModel: CarListViewModelProtocol {
  
  let bannerTitle: String
  let bannerSubtitle: String
  
  @Published var selectedCarMake: CarMake?
  @Published var selectedCarModel: CarModel?
  
  @Published var filterdViewModels: [CarListItemViewModel]
  
  private let itemViewModels: [CarListItemViewModel]
  private var cancellables: [AnyCancellable] = []
  
  init() {
    self.bannerTitle = "Tacoma 2021"
    self.bannerSubtitle = "Get your's now"
    
    do {
      let array: [JSONDictionary] = try jsonDictionaryFromFile("car_list") ?? []
      self.itemViewModels = try array.map { try Car.decode($0) }
        .sorted(by: { $0.marketPrice > $1.marketPrice })
        .map { CarListItemViewModel(car: $0, isExpanded: false) }
      
    } catch {
      print("Failed loading car list from json file")
      self.itemViewModels = []
    }
    
    self.filterdViewModels = self.itemViewModels
    
    self.$selectedCarMake
      .dropFirst()
      .receive(on: RunLoop.main)
      .sink { [weak self] value in
        guard let self = self else {
          return
        }
        self.filterdViewModels = value == nil ? self.itemViewModels : self.itemViewModels.filter { $0.make == value }
      }
      .store(in: &cancellables)
  }
  
  deinit {
    self.cancellables.removeAll()
  }
  
}
