//
//  FoodRow.swift
//  TestFood
//
//  Created by Kevin Do Vale on 29.11.20.
//

import SwiftUI
import SDWebImageSwiftUI

struct FoodRow: View {
    let item:FoodItem
    var body: some View {
        
        return VStack(alignment: .leading, spacing: 7.0){
            
            WebImage(url: URL(string:item.images.cover.removeBraces()))
                .onFailure {error in
                    print(error)
                }
                .resizable()
                .placeholder {
                    Rectangle()
                        .foregroundColor(.gray)
                }
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .aspectRatio(contentMode: .fill)
                .frame(height: 170.0)
                .frame(maxWidth: .infinity)
                .clipped()
            
            Text(item.title)
                .font(.system(size: 15))
                .bold()
                .padding(.horizontal, 8)
            
            Text(item.subtitle)
                .font(.system(size: 15))
                .foregroundColor(Color.gray)
                .padding(.horizontal, 8)
                .padding(.bottom, 12)
        }
    }
}

struct FoodRow_Previews: PreviewProvider {
    static var previews: some View {
        FoodRow(item: FoodItem(id: 1, title: "Titre", subtitle: "subtitle", images: FoodImages(cover: ""), themes: []))
    }
}
