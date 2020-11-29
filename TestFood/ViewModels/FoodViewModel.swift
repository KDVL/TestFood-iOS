//
//  FoodViewModel.swift
//  TestFood
//
//  Created by Kevin Do Vale on 29.11.20.
//

import Foundation

class FoodViewModel: ObservableObject {
    private let id:String
    @Published var model:FoodResponse? = nil
    @Published var loaded = false
    
    init(id:String){
        self.id = id
        load(id: id)
    }

    private func load(id:String){
        FoodAPI.getFood(id: self.id) { (response, error) in
            if let model = response {
                
                self.model = model
            }
            self.loaded = true
        }
    }
}
