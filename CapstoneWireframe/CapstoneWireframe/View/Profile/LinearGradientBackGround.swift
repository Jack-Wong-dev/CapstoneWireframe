//
//  LinearGradientBackGround.swift
//  CapstoneWireframe
//
//  Created by Jack Wong on 1/23/20.
//  Copyright © 2020 Jack Wong. All rights reserved.
//

import SwiftUI

struct LinearGradientBackGround: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color(red: 255/255, green: 251/255, blue: 56/255), Color(red: 254/255, green: 85/255, blue: 84/255)]), startPoint: .leading, endPoint: .trailing)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct LinearGradientBackGround_Previews: PreviewProvider {
    static var previews: some View {
        LinearGradientBackGround()
    }
}
