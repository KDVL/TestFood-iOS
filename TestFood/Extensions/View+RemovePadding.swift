//
//  View+RemovePadding.swift
//  TestFood
//
//  Created by Kevin Do Vale on 29.11.20.
//


import SwiftUI

extension View {
    ///Remove default padding in Lists
    func removePadding() -> some View  {
        return self.listRowInsets(EdgeInsets())
    }
}
