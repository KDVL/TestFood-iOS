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
    @Published private(set) var loaded = false
    @Published private(set) var filter:FacetCategory? = nil
    
    var foodItems:[FoodItem] { get { filtredItems() }}
    
    
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
    
    func setFilter(_ filter:FacetCategory){
        if self.filter?.id == filter.id {
            self.filter = nil
        }else{
            self.filter = filter
        }
    }
    
    private func filtredItems() -> [FoodItem] {
        if filter == nil {
            return model?.items ?? []
        }else {
            return model?.items.filter {
                $0.themes.contains(filter?.id ?? "")
            } ?? []
        }
    }
}
