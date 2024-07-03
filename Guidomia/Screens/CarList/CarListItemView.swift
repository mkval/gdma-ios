//
//  CarListItemView.swift
//  Guidomia
//
//  Created by Mark Valles on 7/4/24.
//

import SwiftUI

struct CarListItemView<ViewModel: CarListItemViewModelProtocol>: View {
  
  @ObservedObject var viewModel: ViewModel
  
  var body: some View {
    VStack(spacing: 16) {
      self.topInfoView()
      
      if self.viewModel.isExpanded {
        self.bottomInfoView()
      }
    }
    .padding(20)
    .background(.primaryLightGray)
    .clipped()
    
    .onTapGesture {
      withAnimation {
        self.viewModel.isExpanded.toggle()
      }
    }
  }
  
  private func topInfoView() -> some View {
    HStack(alignment: .top, spacing: 16) {
      VStack(spacing: 0) {
        if let asset = self.viewModel.imageAsset {
          Image(asset: asset)
            .resizable()
            .scaledToFit()
            .frame(width: 150)
        }
      }
      
      VStack(alignment: .leading, spacing: 4) {
        Text(self.viewModel.name ?? "")
          .font(.system(size: 20, weight: .bold))
          .foregroundColor(.primaryText)
          .minimumScaleFactor(0.5)
        
        Text("\(Strings.CarList.Item.Labels.price): \(self.viewModel.price)")
          .font(.system(size: 17, weight: .semibold))
          .foregroundColor(.primaryText)
        
        Spacer().frame(height: 8)
        
        RatingView(
          maxRating: 5,
          rating: self.viewModel.rating,
          starSize: 15,
          spacing: 6
        )
      }
    }
  }
  
  private func bottomInfoView() -> some View {
    VStack(alignment: .leading, spacing: 20) {
      if !self.viewModel.pros.isEmpty {
        self.bulletList(title: "\(Strings.CarList.Item.Labels.pros):", items: self.viewModel.pros)
      }
      if !self.viewModel.cons.isEmpty {
        self.bulletList(title: "\(Strings.CarList.Item.Labels.cons):", items: self.viewModel.cons)
      }
    }
    .frame(maxWidth: .infinity)
    .padding(.leading, 16)
  }
  
  private func bulletList(title: String, items: [String]) -> some View {
    VStack(spacing: 12) {
      HStack {
        Text(title)
          .font(.system(size: 17, weight: .semibold))
          .foregroundColor(.primaryText)
        Spacer()
      }
      VStack(spacing: 8) {
        ForEach(Array(zip(items.indices, items)), id: \.0) { index, item in
          self.bulletListItem(text: item)
        }
      }
    }
  }
  
  private func bulletListItem(text: String) -> some View {
    HStack(alignment: .top, spacing: 10) {
      VStack {
        Image(systemName: "circle.fill")
          .font(.system(size: 6))
          .foregroundColor(.primaryOrange)
          .padding(.leading, 12)
          .frame(height: 19)
      }
      
      Text(text)
        .font(.system(size: 15, weight: .semibold))
        .foregroundColor(.black)
      Spacer()
    }
  }
}

 #Preview {
   CarListItemView(viewModel: CarListItemViewModel(car: .mockBmw3300i, isExpanded: true))
 }
