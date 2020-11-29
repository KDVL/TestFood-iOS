//
//  CitiesViewModel.swift
//  TestFood
//
//  Created by Kevin Do Vale on 29.11.20.
//

import Foundation

class CitiesViewModel: ObservableObject {

    @Published var model = CitiesResponse(cities: [])
    
    @Published var loaded = false
    
    init(){
        load()
    }

    private func load(){
        
        CitiesAPI.getCities { (response, error) in
            if let model = response {
                
                self.model = model
            }
            self.loaded = true
        }
    }
}
