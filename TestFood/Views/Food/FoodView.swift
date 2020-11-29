//
//  FoodView.swift
//  TestFood
//
//  Created by Kevin Do Vale on 29.11.20.
//

import SwiftUI

struct FoodView: View {
    @ObservedObject private var viewModel: FoodViewModel
    private var cities:[City]
    
    @State var showCities = false
    
    init(id:String, cities:[City]){
        self.viewModel = FoodViewModel(id: id)
        self.cities = cities
    }
    
    var body: some View {
        VStack {
            
            if viewModel.loaded {
                ZStack {
                    List {
                        BannerView(title:viewModel.model?.name ?? "",
                                   subtitle: "Tap here to change address")
                            .removePadding()
                            .onTapGesture {
                                showCities = true
                            }
                        
                        FoodFilters(viewModel: self.viewModel)
                            .removePadding()
                            .padding(.vertical, 20)
                        
                        ForEach(self.viewModel.foodItems, id:\.id){ item in
                            FoodRow(item: item)
                                .removePadding()
                        }
                    }
                    
                    if viewModel.foodItems.count == 0 {
                        Text("No results for this filter")
                    }
                }
                
            }else{
                ActivityIndicator(isAnimating: Binding<Bool>(get: {return true}, set: { _ in }), style: .large)
            }
    
        }
        .navigationBarTitle(Text(viewModel.model?.name ?? ""), displayMode: .inline)
        .navigationBarItems(trailing:CartImage())
        
        .sheet(isPresented: self.$showCities) {
            CitiesListView(currentId: self.viewModel.id, cities: self.cities) {
                self.viewModel.reload(id: $0)
            }
        }
    }
}

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView(id: "geneve", cities: [])
    }
}
