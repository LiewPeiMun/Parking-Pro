//
//  ContentViewModel.swift
//  SwiftUI-UserLocation
//
//  Created by stdc user on 05/03/2023.
//
import MapKit

enum MapDetails {
    //declare this to neat center: and span: in region
    static let startingLocation = CLLocationCoordinate2D (latitude: 3.0698, longitude: 101.5037)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
}

final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {//NSObject CLLocationMnaagerDelegate is to work always check authorization link with func locationManagerDidChangeAuthorization
    
    @Published var region = MKCoordinateRegion(center: MapDetails.startingLocation,
                                               span: MapDetails.defaultSpan )
    //use @published because whenever this region changes our UI will update
    
    
    var locationManager: CLLocationManager?
    //? because user can turn off their location so we can't see their location
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            //If location manager is true, then we will go ahead create our location manager
            locationManager = CLLocationManager()
            //locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            //what activity we want, for this we want user location used .desiredAccuracy
            //checkLocationAuthorization() (now this call is redundant because of CLLocationManagerDelegate)
            //to check authorization for open apps
            locationManager!.delegate = self
            //if use symbol '?' for optional but symbol '!' for force
        } else {
            print("Show an alert letting them know this is off and to go turn it on.")
        }
    }
    //to handle permission case
    private func checkLocationAuthorization() {
    //make it private for only ContentViewModel, so it will be only calling in this model
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
        // this is all cases that we need to handle
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            //many types of req but we choose this one
        case .restricted:
            print("Your location is restricted likely due to parental controls.")
            //alert messages
        case .denied:
            print("You have denied this app location permission. Go into setting to change it.")
        case .authorizedAlways, .authorizedWhenInUse:
            //same thing so i want to put in same line
            region = MKCoordinateRegion(center: locationManager.location!.coordinate,
                                        span: MapDetails.defaultSpan)
            //break is to come back again to this permission if it denied
        @unknown default:
            break
        }
    }
    // to get notification if user change it to off again
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
        //to still check authorization when app running
    }
    
}
