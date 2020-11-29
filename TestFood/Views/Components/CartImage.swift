//
//  CartImage.swift
//  TestFood
//
//  Created by Kevin Do Vale on 29.11.20.
//

import SwiftUI

struct CartImage:View {
    var body: some View {
        HStack {
            Image("header-cart")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height:30)
        }
    }
}

struct CartImage_Previews: PreviewProvider {
    static var previews: some View {
        CartImage()
    }
}
