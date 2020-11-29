//
//  CitiesAPI.swift
//  TestFood
//
//  Created by Kevin Do Vale on 29.11.20.
//

import Foundation

class CitiesAPI {
    
    typealias CitiesCallback = (_ response:CitiesResponse?, _ error:Error?) -> Void
    
    static func getCities(callback: @escaping CitiesCallback){
        
        let session = URLSession.shared
        let url = URL(string: Endpoints.citiesURL)!
        
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
         
            if let json = data {
                let response = try? JSONDecoder().decode(CitiesResponse.self, from: json)
                callback(response, error)
            }else {
                callback(nil, error)
            }
        })
        
        task.resume()
    }
}
