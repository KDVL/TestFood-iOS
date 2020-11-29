//
//  ModalHeader.swift
//  TestFood
//
//  Created by Kevin Do Vale on 29.11.20.
//

import SwiftUI

struct ModalHeader: View {
    let title:String
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack{
            Text(title)
        
            VStack {
                HStack(alignment: .top, spacing: 0.0) {
                    Spacer()
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }){
                        RoundedCloseButton()
                            .padding(.trailing, 10)
                            .padding(.top, 8)
                    }.buttonStyle(PlainButtonStyle())
                }
                Spacer()
            }.frame(maxHeight:55)
        }
        .frame(minHeight:55)
    }
}


struct RoundedCloseButton: View {
    var body: some View {
        Image("close")
            .resizable()
            .colorMultiply(Color.black)
            .frame(maxWidth: 10, maxHeight: 10)
            .padding(7)
            .background(Color("roundedclosebtn"))
            .clipShape(Circle())
            .shadow(radius: 10)
    }
}

struct ModalHeader_Previews: PreviewProvider {
    static var previews: some View {
        ModalHeader(title: "Filters")
    }
}

