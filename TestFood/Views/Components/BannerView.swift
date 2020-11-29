//
//  BannerView.swift
//  TestFood
//
//  Created by Kevin Do Vale on 29.11.20.
//

import SwiftUI

struct BannerView:View {
    let title:String
    let subtitle:String
    
    var body: some View {
        HStack {
            
            Image("banner-pin")
                .resizable()
                .scaledToFit()
                .frame(height: 47)
            
            ZStack{
                
                HStack{
                    VStack(alignment: .leading, spacing: 5.0) {
                        Text(title)
                            .bold()
                            .foregroundColor(Color.white)
                        Text(subtitle)
                            .foregroundColor(Color.white)
                    }.padding(.vertical, 16)
                    
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    
                    Image("banner-search")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height:90, alignment: .center)
                        .clipped()
                }
            }
            
        }.background(Color.accentColor)
    }
}

struct BannerView_Previews: PreviewProvider {
    static var previews: some View {
        BannerView(title: "Hungry? We deliver!",
                   subtitle: "Tap here to select an address")
    }
}
