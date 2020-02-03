//
//  SavedView.swift
//  CapstoneWireframe
//
//  Created by Jack Wong on 1/17/20.
//  Copyright © 2020 Jack Wong. All rights reserved.
//

import SwiftUI

struct SavedView: View {
    
    let array = ["505 W 143rd St #51 \nWashington Heights, New York, NY", "241 W 105th St #14F \nHarlem, New York, NY", "526 W 158th St #51 \nWashington Heights, New York, NY", "Anna-Lena", "George", "John", "Greg", "Thomas", "Robert", "Bernie", "Mike", "Benno", "Hugo", "Miles", "Michael", "Mikel", "Tim", "Tom", "Lottie", "Lorrie", "Barbara"]
    
    @State private var searchText = ""
    
    var body: some View {
        
        ZStack{
            
            LinearGradient(gradient: Gradient(colors: [Color(red: 255/255, green: 251/255, blue: 56/255), Color(red: 254/255, green: 85/255, blue: 84/255)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            List {
                // Filtered list of names
                ForEach(array.filter{$0.hasPrefix(searchText) || searchText == ""}, id:\.self) {
                    searchText in
                    
                    VStack(alignment: .leading){
                        
                        
                        Image("placeholder")
                            .resizable()
                            .scaledToFit()
//                            .overlay((Image("heart")
//                                .resizable()
//                                .frame(width: 40, height: 40).padding([.top,.trailing])), alignment: .topTrailing)
                        
                        
                        
                        
                        VStack(alignment: .leading){
                            
                            Text("$500,000")
                                .font(.headline)
                            
                            Text("2 Beds, 1 Bath, 1000 sqft")
                            
                            Text(searchText)
                                .foregroundColor(.purple)
                            
                        }
                        
                    }
                    
                    
                }
            }
            .resignKeyboardOnDragGesture()
            
            
            
        }
        
    }
}

struct SavedView_Previews: PreviewProvider {
    static var previews: some View {
        SavedView()
    }
}
