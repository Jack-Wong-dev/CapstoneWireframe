//
//  SearchView.swift
//  CapstoneWireframe
//
//  Created by Jack Wong on 1/17/20.
//  Copyright © 2020 Jack Wong. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    let array = ["505 W 143rd St #51 \nWashington Heights, New York, NY", "241 W 105th St #14F \nHarlem, New York, NY", "526 W 158th St #51 \nWashington Heights, New York, NY", "Anna-Lena", "George", "John", "Greg", "Thomas", "Robert", "Bernie", "Mike", "Benno", "Hugo", "Miles", "Michael", "Mikel", "Tim", "Tom", "Lottie", "Lorrie", "Barbara"]
    
    static let displayTypes = ["List View", "Map View"]
    
    @State var mapPresent: Bool = false
    
    @State var isNavigationBarHidden: Bool = true
    @State var filterIsPresented: Bool = false
    
    @State private var searchText = ""
    
    @State private var displayType = 0
    
    var body: some View {
        
        NavigationView{
            
            VStack {
                
                HStack{
                    // Search view
                    SearchBarView(searchText: $searchText)
                    Button(action: {
                        print("filter")
                        
                        withAnimation {
                            self.filterIsPresented.toggle()
                        }
                        
                    }) {
                        
                        Text("Filter")
                            .padding(.trailing)
                    }
                    .sheet(isPresented: $filterIsPresented){
                        FilterView()
                    }
                    
                    
                }
                
                Picker("Listing Type", selection: $displayType) {
                    
                    ForEach(0 ..< Self.displayTypes.count){
                        Text("\(Self.displayTypes[$0])")
                    }
                }.pickerStyle(SegmentedPickerStyle())
                

                
                if displayType == 1{
                    SlideOverCardContentView()
                }
                
                
                if displayType == 0{
                    
                    List {
                                    // Filtered list of names
                                    ForEach(array.filter{$0.hasPrefix(searchText) || searchText == ""}, id:\.self) {
                                        searchText in
                                        
                                        VStack(alignment: .leading){
                                            
                                            
                                            Image("placeholder")
                                                .resizable()
                                                .scaledToFit()
                                                .overlay((Image("heart")
                                                    .resizable()
                                                    .frame(width: 40, height: 40).padding([.top,.trailing])), alignment: .topTrailing)
                                            
                                            
                                            
                                            
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
                
            
                
                
            .navigationBarTitle("")
            .navigationBarHidden(true)
            
        }
        
        
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            SearchView()
                .environment(\.colorScheme, .light)
            SearchView()
                .environment(\.colorScheme, .dark)
        }
    }
}


