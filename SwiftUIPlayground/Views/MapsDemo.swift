//
//  MapsDemo.swift
//  SwiftUIPlayground
//
//  Created by StartupBuilder.INFO on 9/20/20.
//

import SwiftUI
import MapKit

struct MapsDemo: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))

    
    var body: some View {
        Map(coordinateRegion: $region).edgesIgnoringSafeArea(.all)
    }
}

struct MapsDemo_Previews: PreviewProvider {
    static var previews: some View {
        MapsDemo()
    }
}
