//
//  ProfileView.swift
//  CapstoneWireframe
//
//  Created by Jack Wong on 1/17/20.
//  Copyright © 2020 Jack Wong. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    var image: Image
    
    var body: some View {
        
        
        ZStack{
            
            LinearGradient(gradient: Gradient(colors: [Color(red: 255/255, green: 251/255, blue: 56/255), Color(red: 254/255, green: 85/255, blue: 84/255)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 20){
                
                HStack{
                    Spacer()
                    Button(action: {
                        print("edit button pressed")
                    }) {
                        Text("Edit")
                    }
                }
                
                HStack(spacing: 40){
                    
                    image
                        .resizable()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                    VStack{
                        Text("Mike Rotch")
                        Text("Agency goes here")
                            .padding(.top)
                    }
                }
                
                Divider()
                
                Text("Member Since: Forever")
                Text("Realtor License:  1234567890")
                
                Divider()
                
                Section(header: Text("Bio:")) {
                    Text("Bio goes here")
                }.padding(.top)
                
                Divider()
                
                Section(header: Text("Listings:")) {
                    Text("Listings goes here")
                }.padding(.top)
                
                Spacer()
            }.padding([.leading, .top, .trailing])
            
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ProfileView(image: Image("turtlerock"))
                .environment(\.colorScheme, .light)
            ProfileView(image: Image("turtlerock"))
                .environment(\.colorScheme, .dark)
        }
    }
}
