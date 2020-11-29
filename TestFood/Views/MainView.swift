//
//  MainView.swift
//  TestFood
//
//  Created by Kevin Do Vale on 29.11.20.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        TabView {
           CitiesView()
             .tabItem {
                Image(uiImage: (UIImage(named: "tab-deindeal")?.withRenderingMode(.alwaysTemplate))!)
                Text("Deindeal")
              }
            
         Text("Commandes")
             .tabItem {
                Image(systemName:"line.horizontal.3")
                Text("Commandes")
              }
            
         Text("Compte")
           .tabItem {
              Image(systemName:"person.fill")
              Text("Compte")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        CitiesView()
    }
}
