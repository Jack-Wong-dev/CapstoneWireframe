//
//  SlideOverCardContentView.swift
//  CapstoneWireframe
//
//  Created by Jack Wong on 1/20/20.
//  Copyright © 2020 Jack Wong. All rights reserved.
//
import SwiftUI
import MapKit
import SlideOverCard // Add import

struct SlideOverCardContentView : View {
    @State private var position = CardPosition.middle
    @State private var background = BackgroundStyle.blur
    
    
    var body: some View {
        ZStack(alignment: Alignment.top) {
            MapView()
//            VStack {
//                Picker(selection: self.$position, label: Text("Position")) {
//                    Text("Bottom").tag(CardPosition.bottom)
//                    Text("Middle").tag(CardPosition.middle)
//                    Text("Top").tag(CardPosition.top)
//                }.pickerStyle(SegmentedPickerStyle())
//                Picker(selection: self.$background, label: Text("Background")) {
//                    Text("Blur").tag(BackgroundStyle.blur)
//                    Text("Clear").tag(BackgroundStyle.clear)
//                    Text("Solid").tag(BackgroundStyle.solid)
//                }.pickerStyle(SegmentedPickerStyle())
//            }.padding().padding(.top, 25)
            SlideOverCard($position, backgroundStyle: $background) {
                VStack(alignment: .leading) {
                    Image("example")
                        .resizable()
                        .scaledToFit()
                        .overlay((Image("heart").padding()),alignment: .topTrailing)
                    
                    Text("$500,000")
                        .font(.headline).padding(.leading)
                    
                    Text("2 Beds, 1 Bath, 1000 sqft")
                    .padding(.leading)
                    
                    Text("505 W 143rd St #51 \nWashington Heights, New York, NY")
                        .foregroundColor(.purple)
                    .padding(.leading)
                    
                    Spacer()
                }
                
            }
        }
        .edgesIgnoringSafeArea(.vertical)
    }
}

struct MapView : UIViewRepresentable {
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(latitude: -33.523065, longitude: 151.394551)
        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
    }
}

struct SlideOverCardContentView_Previews: PreviewProvider {
    static var previews: some View {
        SlideOverCardContentView()
    }
}
