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
    VStack {
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
          
          Spacer()
        }
        Spacer()
      }
      .padding(20)
    }
    .background(.primaryLightGray)
  }
}

 #Preview {
   CarListItemView(viewModel: CarListItemViewModel(car: .mockBmw3300i))
 }
