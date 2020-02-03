//
//  FilterView.swift
//  CapstoneWireframe
//
//  Created by Jack Wong on 1/17/20.
//  Copyright © 2020 Jack Wong. All rights reserved.
//

import SwiftUI

struct FilterView: View {
    
    static let listingTypes = ["For Purchase", "For Rent", "Room Shares"]
    static let bedRooms = ["Studio","1+", "2+","3+","4+","5+","6+"]
    static let bathRooms = ["1","2","3+"]
    static let pets = ["None","Cat","Dog"]
    static let daysOnAppOptions = ["1  week", "2 weeks","3 weeks", "1 month+"]
    
    
    @State private var pet = 0
    @State private var listingType = 0
    @State private var bedQuantity = 0
    @State private var bathQuantity = 0
    @State private var squareFeet: Double = 0
    @State private var squareFt: Int = 0
    @State private var daysOnApp = 0
    @State private var price : Double = 0
    
    
    var body: some View {
        
        VStack{
            
            HStack{
                Button(action: {
                    print("Button Pressed")
                }) {
                    Text("Cancel")
                }
                
                Spacer()
                
                Text("Filters")
                
                Spacer()
                
                Button(action: {
                    print("Button Pressed")
                }) {
                    Text("Reset")
                }
            }
            .padding([.leading, .top, .trailing])
            
            Form{
                Picker("Listing Type", selection: $listingType) {
                    
                    ForEach(0 ..< Self.listingTypes.count){
                        Text("\(Self.listingTypes[$0])")
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
                if listingType == 1 {
                    
                    
                    Section(header: Text("Pets")) {
                        Picker("Bed Quantity", selection: $pet) {
                            
                            ForEach(0 ..< Self.pets.count){
                                Text("\(Self.pets[$0])")
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                    
                    
                    
                    
                }
                
                
                
                
                Section(header: Text("Number of bedrooms")) {
                    Picker("Bed Quantity", selection: $bedQuantity) {
                        
                        ForEach(0 ..< Self.bedRooms.count){
                            Text("\(Self.bedRooms[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Number of bathrooms")) {
                    Picker("Bed Quantity", selection: $bathQuantity) {
                        
                        ForEach(0 ..< Self.bathRooms.count){
                            Text("\(Self.bathRooms[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Square Feet")){
                    VStack {
                        
                        Text("\(squareFeet, specifier: "%.0f") sqft")
                    }
                }
                
                Section(header: Text("Time of listing")) {
                    Picker("Time Frame", selection: $daysOnApp) {
                        
                        ForEach(0 ..< Self.daysOnAppOptions.count){
                            Text("\(Self.daysOnAppOptions[$0])")
                                .lineLimit(nil)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Price")){
                    VStack {
                        Slider(value: $price, in: 0...10000000, step: 1000)
                        Text("$\(price, specifier: "%.2f")")
                    }
                }
                
                Button(action: {
                    print("Button Pressed")
                }) {
                    Text("Search")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                }
                
            }
            
            
            
        }
        
        
    }
    
    
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            FilterView()
                .environment(\.colorScheme, .light)
            FilterView()
                .environment(\.colorScheme, .dark)
        }
    }
}
