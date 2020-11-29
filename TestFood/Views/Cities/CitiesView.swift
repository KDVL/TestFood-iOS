//
//  CitiesView.swift
//  TestFood
//
//  Created by Kevin Do Vale on 29.11.20.
//

import SwiftUI

struct CitiesView: View {
    @ObservedObject var viewModel = CitiesViewModel()
    
    var body: some View {
        NavigationView {
            if viewModel.loaded {
                
                List {
                    
                    BannerView(title:"Hungry? We deliver!",
                               subtitle:"Tap here to select an address")
                        .removePadding()
                    
                    Text("Nearby cities: ")
                    
                    if viewModel.model.cities.count > 0 {
                        CitiesSlider(cities: Binding<[City]>(get: {return viewModel.model.cities }, set: { _ in }))
                            .removePadding()
                    }
            
                    Image("cities-bottom")
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal, 20)
                    
                }.styleList()
                .navigationBarTitle(Text(""), displayMode: .large)
                .navigationBarItems(leading:DeindealHeader(),
                                    trailing:CartImage())
            }else{
                ActivityIndicator(isAnimating: Binding<Bool>(get: {return true}, set: { _ in }), style: .large)
            }
        }
    }
}


struct DeindealHeader:View {
    var body: some View {
        HStack {
            Image("header-deindeal")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height:56)
        }
    }
}

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

struct CitiesView_Previews: PreviewProvider {
    static var previews: some View {
        CitiesView()
    }
}
