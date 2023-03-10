//
//  ContentView.swift
//  SwiftUI-UserLocation
//
//  Created by stdc user on 05/03/2023.
//

import MapKit
import SwiftUI

struct MapView: View {
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
            .ignoresSafeArea()
            .accentColor(Color(.systemPink))
            .onAppear {
                viewModel.checkIfLocationServicesIsEnabled()
                // because i made checkLocationAuthorization in private so on this check available to avoid mistake
            }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
