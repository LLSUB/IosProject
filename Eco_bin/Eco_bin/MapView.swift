//
//  MapView.swift
//  Eco_bin
//
//  Created by JWON on 2021/05/31.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    var viewmodel: FilterViewModel
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.89007678904974, longitude: 128.61137186528217) , span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

    var body: some View {
        Map(coordinateRegion: $region, showsUserLocation:true, userTrackingMode: .constant(.follow))
            .edgesIgnoringSafeArea(.all)
    }
}
