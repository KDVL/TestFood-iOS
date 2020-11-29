//
//  FoodFilters.swift
//  TestFood
//
//  Created by Kevin Do Vale on 29.11.20.
//

import SwiftUI
import SDWebImageSwiftUI
import SDWebImageSVGCoder

struct FoodFilters: View{
    var viewModel:FoodViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
        
            ScrollViewPager(axis: .horizontal,
                            numberOfPages: viewModel.model?.facetCategories.count ?? 0,
                            pagingEnabled: false,
                            pageControlEnabled: false,
                            hideScrollIndicators: true) {
                
                HStack(spacing: 0) {
                    ForEach(viewModel.model?.facetCategories ?? [], id:\.id){ item in
                        FoodFiltersItem(item: item)
                            .onTapGesture {
                                
                            }
                            .padding(.horizontal, 10)
                            
                    }
                }.padding(.horizontal, 10)
                
            }.frame(maxWidth:.infinity)
            
        }.frame(maxWidth: .infinity, minHeight: 80)
    }
}



struct FoodFiltersItem: View {
    let item:FacetCategory
    
    var body: some View {
        
        VStack {
            
            WebImage(url: URL(string: item.icon))
                .resizable()
                .placeholder {
                    Circle().foregroundColor(.gray)
                }
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .aspectRatio(contentMode: .fit)
                .frame(width: 35, height:35)
            
            Text(item.label)
                .font(.system(size: 15))
                
            
        }
        
        
    }
}
