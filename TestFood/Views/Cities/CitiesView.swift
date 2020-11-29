//
//  CitiesView.swift
//  TestFood
//
//  Created by Kevin Do Vale on 29.11.20.
//

import SwiftUI
import Introspect

struct CitiesView: View {
    @ObservedObject var viewModel = CitiesViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.loaded {
                    
                    List {
                        
                        BannerView(title:"Hungry? We deliver!",
                                   subtitle:"Tap here to select an address")
                            .removePadding()
                            .background(Color.white)
                        
                        if viewModel.model.cities.count > 0 {
                            CitiesSlider(cities: Binding<[City]>(get: {return viewModel.model.cities }, set: { _ in }))
                                .removePadding()
                                .background(Color.white)
                        }
                        
                        Image("cities-bottom")
                            .resizable()
                            .scaledToFit()
                            .padding(20)
                            .background(Color.white)
                    }
                    .introspectTableView { $0.separatorStyle = .none }
                    .styleList()
            
                }else{
                    ActivityIndicator(isAnimating: Binding<Bool>(get: {return true}, set: { _ in }), style: .large)
                }
            }
            .navigationBarTitle(Text(""), displayMode: .large)
            .navigationBarItems(leading:DeindealHeader(),
                                trailing:CartImage())
            .introspectViewController { vc in
                vc.navigationController?.navigationBar.prefersLargeTitles = true
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
                .frame(height:80)
                .padding(.top, 50.0)
        }
    }
}


struct CitiesView_Previews: PreviewProvider {
    static var previews: some View {
        CitiesView()
    }
}
