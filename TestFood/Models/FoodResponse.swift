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
    let i18N: I18N

    enum CodingKeys: String, CodingKey {
        case id, name, items, facetCategories
        case i18N = "i18n"
    }
}

// MARK: - FacetCategory
struct FacetCategory: Codable {
    let id, label: String
    let icon: String
    let isPopular: Bool
    let count: Int
    var selected: Bool
}

// MARK: - I18N
struct I18N: Codable {
    let sales: Sales
}

// MARK: - Sales
struct Sales: Codable {
    let filtering: Filtering
    let timer: Timer
}

// MARK: - Filtering
struct Filtering: Codable {
    let title: String
    let defaultOptions: DefaultOptions
}

// MARK: - DefaultOptions
struct DefaultOptions: Codable {
    let defaultOptionsDefault, city, travel: String

    enum CodingKeys: String, CodingKey {
        case defaultOptionsDefault = "default"
        case city, travel
    }
}

// MARK: - Timer
struct Timer: Codable {
    let saleEnded, days, day, endIn: String
    let shortEndIn, today: String
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
