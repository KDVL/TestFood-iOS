//
//  CitiesSlider.swift
//  TestFood
//
//  Created by Kevin Do Vale on 29.11.20.
//

import SwiftUI
import SDWebImageSwiftUI

struct CitiesSlider: View{
    
    @Binding var cities:[City]
    
    @State var isActive = false
    @State var item:City?
    
    var body: some View {
        VStack(alignment: .leading) {
        
            Text("Nearby cities: ")
                .font(.system(size: 20.0, weight: .light))
                .padding(.top, 10)
                .padding(.leading, 20)
        
            ZStack {
                
                 if item != nil {
                    NavigationLink(destination: FoodView(id: item!.id, cities: cities),
                                   isActive: self.$isActive){EmptyView()}.hidden()
                 }
                
                CitiesSliderContent(cities: $cities){
                    self.item = $0
                    self.isActive = true
                }
            }
        }.frame(maxWidth: .infinity, minHeight: 160)
    }
}

struct CitiesSliderContent: View {
    @Binding var cities:[City]
    
    var onTap:(City)->()
    
    var body: some View {
        GeometryReader { g in
            ZStack{
                ScrollViewPager(axis: .horizontal,
                                numberOfPages: self.cities.count,
                                pagingEnabled: false,
                                pageControlEnabled: false,
                                hideScrollIndicators: true) {
                    
                    HStack(spacing: 0) {
                        ForEach(self.cities, id:\.id){ item in
                            CitiesSliderItem(city: item)
                                .onTapGesture {
                                    self.onTap(item)
                                }
                                .padding(.horizontal, 10)
                                
                        }
                    }.padding(.horizontal, 10)
                    
                }.frame(width: g.size.width)
            }.frame(width: g.size.width, height: g.size.height)
        }
    }
}


struct CitiesSliderItem: View {
    let city:City
    
    var body: some View {
        
        ZStack {
            
            WebImage(url: URL(string: city.channelInfo.images.small))
                .resizable()
                .placeholder {
                    Rectangle().foregroundColor(.gray)
                }
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .aspectRatio(contentMode: .fill)
                .frame(width: 182, height:100)
                .clipped()
                .cornerRadius(10)
            
            HStack {
                VStack(alignment: .leading){
                    Spacer()
                    
                    Text(city.channelInfo.title.uppercased())
                        .font(.system(size: 20.0))
                        .foregroundColor(Color.white)
                        .padding(.horizontal, 8.0)
                        .padding(.vertical, 5)
                        .shadow(color: .black, radius: 3)
                }
                Spacer()
            }
        }
        
    }
}

