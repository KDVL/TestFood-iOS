//
//  FoodAPI.swift
//  TestFood
//
//  Created by Kevin Do Vale on 29.11.20.
//

import Foundation

class FoodAPI {
    
    typealias FoodCallback = (_ response:FoodResponse?, _ error:Error?) -> Void
    
    static func getFood(id:String, callback: @escaping FoodCallback){
        
        let session = URLSession.shared
        let url = URL(string: Endpoints.foodURL + id)!
        
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
         
            if let json = data {
                let response = try? JSONDecoder().decode(FoodResponse.self, from: json)
                DispatchQueue.main.async {
                    callback(response, error)
                }
            }else {
                DispatchQueue.main.async {
                    callback(nil, error)
                }
            }
        })
        
        task.resume()
    }
}
