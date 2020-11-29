//
//  CitiesResponse.swift
//  TestFood
//
//  Created by Kevin Do Vale on 29.11.20.
//

import Foundation

// MARK: - CitiesResponse
struct CitiesResponse: Codable {
    let cities: [City]
}

// MARK: - City
struct City: Codable {
    let id: String
    let channelInfo: ChannelInfo
}

// MARK: - ChannelInfo
struct ChannelInfo: Codable {
    let title: String
    let mapInfo: MapInfo
    let isDefault, excludeFromSubscription: Bool
    let images: Images
}

// MARK: - Images
struct Images: Codable {
    let small, large: String
}

// MARK: - MapInfo
struct MapInfo: Codable {
    let geolocation: Geolocation
    let zoom: Int
}

// MARK: - Geolocation
struct Geolocation: Codable {
    let latitude, longitude: Double
}
