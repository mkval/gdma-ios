//
//  CarList.swift
//  Guidomia
//
//  Created by Mark Valles on 7/4/24.
//

import SwiftUI

struct CarList<ViewModel: CarListViewModelProtocol>: View {
  
  @StateObject private var viewModel: ViewModel
  
  init(viewModel: ViewModel) {
    self._viewModel = StateObject(wrappedValue: viewModel)
  }
  
  var body: some View {
    ScrollView {
      LazyVStack(spacing: 0) {
        self.headerView()
        
        self.filterView()
        
        ForEach(self.viewModel.itemViewModels) { itemViewModel in
          CarListItemView(viewModel: itemViewModel)
          self.divider()
        }
      }
      .frame(maxWidth: .infinity)
    }
  }
  
  private func filterView() -> some View {
    VStack {
      VStack {
        VStack(spacing: 16) {
          HStack {
            Text("Filters")
              .font(.system(size: 18))
              .foregroundColor(.white)
            Spacer()
          }
          
          Button(action: {
            
          }, label: {
            /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
          })
          .frame(maxWidth: .infinity)
          .border(.green, width: 1)
          
          Button(action: {
            
          }, label: {
            /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
          })
          .frame(maxWidth: .infinity)
          .border(.green, width: 1)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .padding(.bottom, 16)
      }
      .background(.primaryDarkGray)
      .frame(maxWidth: .infinity)
      .cornerRadius(8)
    }
    .background(.white)
    .padding(20)
  }
  
  private func headerView() -> some View {
    ZStack {
      VStack {
        Image(asset: Assets.Images.Banner.tacoma)
          .resizable()
          .scaledToFit()
      }
      
      VStack {
        Spacer()
        HStack {
          Text(self.viewModel.bannerTitle)
            .font(.system(size: 40, weight: .bold))
            .foregroundColor(.white)
          Spacer()
        }
        HStack {
          Text(self.viewModel.bannerSubtitle)
            .font(.system(size: 20, weight: .semibold))
            .foregroundColor(.white)
          Spacer()
        }
        .padding(.leading, 8)
      }
      .padding(20)
    }
  }
  
  private func divider() -> some View {
    HStack {
      Rectangle()
        .frame(maxWidth: .infinity)
        .frame(height: 2)
        .foregroundColor(.primaryOrange)
        .padding(.horizontal, 20)
        .padding(.vertical, 14)
    }
    .background(.white)
  }
}

#Preview {
  CarList(viewModel: CarListViewModel())
}
