//
//  List+StyleList.swift
//  TestFood
//
//  Created by Kevin Do Vale on 29.11.20.
//

import SwiftUI


extension View {
    func styleList() -> some View  {
        Group {
            if #available(iOS 14.0, *) {

                self.listStyle(PlainListStyle())
            }else {
                self
            }
        }
    }
}
