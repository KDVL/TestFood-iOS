//
//  FoodResponse.swift
//  TestFood
//
//  Created by Kevin Do Vale on 29.11.20.
//

import Foundation


// MARK: - FoodResponse
struct FoodResponse: Codable {
    let id, name: String
    let items: [FoodItem]
    let facetCategories: [FacetCategory]
}

// MARK: - FacetCategory
struct FacetCategory: Codable {
    let id, label: String
    let icon: String
}

// MARK: - Item
struct FoodItem: Codable {
    let id: Int
    let title, subtitle: String
    let images: FoodImages
    let themes: [String]
    
    enum CodingKeys: String, CodingKey {
        case themes = "myThemes"
        case images, id, title, subtitle
    }
}

// MARK: - FoodImages
struct FoodImages: Codable {
    let cover: String
}
