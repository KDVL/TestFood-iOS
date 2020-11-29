//
//  CitiesSlider.swift
//  TestFood
//
//  Created by Kevin Do Vale on 29.11.20.
//

import SwiftUI

struct CitiesSlider: View{
    
    @Binding var cities:[City]
    
    // @State var isActive = false
    //  @State var item:City?
    
    var body: some View {
        VStack {
            ZStack {
                
                /* if item != nil {
                 NavigationLink(destination: , isActive: self.$isActive){EmptyView()}.hidden()
                 }*/
                
                CitiesSliderContent(cities: $cities)
                
                /*
                 { city in
                 self.item = city
                 self.isActive = true
                 }
                 
                 */
            }
        }.frame(maxWidth: .infinity, minHeight: 120)
    }
}

struct CitiesSliderContent: View {
    @Binding var cities:[City]
    
    //var onTapEvent:(City)->()
    
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
                            
                            CitiesSliderItem(title: "GENEVE")
                                .padding(.leading, 20)
                        }
                    }
                    
                }.frame(width: g.size.width)
            }.frame(width: g.size.width, height: g.size.height)
        }
    }
}


struct CitiesSliderItem: View {
    let title:String
    //@ObservedObject var imageLoader:ImageLoader
    
    var body: some View {
        
        ZStack {
            
            Image("cities-bottom")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 182, height:100)
                .clipped()
                .cornerRadius(10)
            
            HStack {
                VStack(alignment: .leading){
                    Spacer()
                    
                    Text(title)
                        .font(.system(size: 20.0))
                        .foregroundColor(Color.white)
                        .padding(.horizontal, 8.0)
                        .padding(.vertical, 5)
                        
                        .shadow(color: .black, radius: 3)
                }
                Spacer()
            }
            
        }.background(Color("teaserBackground"))
        
    }
}

