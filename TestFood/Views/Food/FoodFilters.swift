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
    @ObservedObject var viewModel:FoodViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
        
            ScrollViewPager(axis: .horizontal,
                            numberOfPages: viewModel.model?.facetCategories.count ?? 0,
                            pagingEnabled: false,
                            pageControlEnabled: false,
                            hideScrollIndicators: true) {
                
                HStack(spacing: 0) {
                    ForEach(viewModel.model?.facetCategories ?? [], id:\.id){ item in
                        FoodFiltersItem(item: item, selected: (item.id == viewModel.filter?.id))
                            .onTapGesture {
                                viewModel.setFilter(item)
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
    let selected:Bool
    
    var body: some View {
        
        var text =
            Text(item.label)
                .font(.system(size: 15))
        
        if selected {
            text = text.bold()
                .foregroundColor(Color.accentColor)
        }
        
        return VStack {
            
            WebImage(url: URL(string: item.icon))
                .resizable()
                .placeholder {
                    Circle().foregroundColor(.gray)
                }
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .aspectRatio(contentMode: .fit)
                .frame(width: 35, height:35)
                .padding(8)
                .background(selected ? Color.accentColor : Color.clear)
                .cornerRadius(30)
            
            text
        }
    }
}
