//
//  FoodView.swift
//  TestFood
//
//  Created by Kevin Do Vale on 29.11.20.
//

import SwiftUI

struct FoodView: View {
    @ObservedObject private var viewModel: FoodViewModel
    private var id:String
    
    init(id:String){
        self.id = id
        self.viewModel = FoodViewModel(id: id)
    }
    
    var body: some View {
        VStack {
            
            if viewModel.loaded {
                List {
                    BannerView(title:id.capitalized, subtitle: "Tap here to change address")
                        .removePadding()
                    
                }
                
            }else{
                ActivityIndicator(isAnimating: Binding<Bool>(get: {return true}, set: { _ in }), style: .large)
            }
    
        }
        .navigationBarTitle(Text(id.capitalized), displayMode: .inline)
        .navigationBarItems(trailing:CartImage())
    }
}

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView(id: "geneve")
    }
}
