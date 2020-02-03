//
//  AppView.swift
//  CapstoneWireframe
//
//  Created by Jack Wong on 1/17/20.
//  Copyright © 2020 Jack Wong. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        
        TabView {
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
            }
            SavedView()
                .tabItem {
                    Image(systemName: "bookmark")
                    Text("Saved")
            }
            ProfileView(image: Image("turtlerock"))
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
            }
        }
        
    }
    
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            AppView()
            .environment(\.colorScheme, .dark)
            AppView()
                .environment(\.colorScheme, .light)
            
        }
    }
}
