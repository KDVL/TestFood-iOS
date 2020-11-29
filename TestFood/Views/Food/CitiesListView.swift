//
//  CitiesListView.swift
//  TestFood
//
//  Created by Kevin Do Vale on 29.11.20.
//

import SwiftUI

struct CitiesListView: View {
    let currentId:String
    
    var cities:[City]
    
    let callback:(String)->()
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing:0.0){
            ModalHeader(title:"Cities")
    
            List {
                ForEach(self.cities, id:\.id) { item in
                    Button(action: {
                        callback(item.id)
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        CitiesListViewRow(filter: item.channelInfo.title,
                                          selected:self.currentId == item.id)
                            .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                    }
                    .removePadding()
                }
            }
            .styleList()
            .environment(\.defaultMinListRowHeight, 45)
        }
    }
}

struct CitiesListViewRow : View {
    var filter:String
    var selected:Bool
    var body: some View {
        HStack {
            Text(filter)
            .multilineTextAlignment(.leading)
            Spacer()
            RoundedButton(selected: selected)
        }
    }
}

struct RoundedButton : View {
    var selected:Bool
    
    var body: some View {
        VStack {
            if selected {
                Image("check")
                    .resizable()
                    .frame(width: 10, height: 10)
                    .colorMultiply(Color.white)
                    .padding(7)
                    .background(Color.accentColor)
                    .clipShape(Circle())
                    .shadow(radius: 10)
            }else {
                Circle()
                    .stroke(Color("roundedclosebtn"))
                    .frame(width: 23, height: 23)
            }
        }
    }
}


struct CitiesListView_Previews: PreviewProvider {
    static var previews: some View {
        CitiesListView(currentId: "1", cities: []) { _ in }
    }
}
