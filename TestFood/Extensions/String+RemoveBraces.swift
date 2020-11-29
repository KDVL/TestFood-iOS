//
//  String+RemoveBraces.swift
//  TestFood
//
//  Created by Kevin Do Vale on 29.11.20.
//

import Foundation

extension String {
    func removeBraces() -> String{
        return
            self.replacingOccurrences(of: "{", with: "%7B")
                .replacingOccurrences(of: "}", with: "%7D")
    }
}
