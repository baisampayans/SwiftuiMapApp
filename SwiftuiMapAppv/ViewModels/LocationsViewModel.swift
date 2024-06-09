//
//  LocationsViewModel.swift
//  SwiftuiMapAppv
//
//  Created by baisampayan saha on 6/7/24.
//

import Foundation
import MapKit
import SwiftUI


class LocationViewModel: ObservableObject {
    
    // All loaded location
    @Published var locations: [Location]
    
    // Current location on map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    
    // current region on map
    @Published var mapRegion: CLLocationCoordinate2D = CLLocationCoordinate2D()

    // show list of locations
    @Published var showLocationList: Bool = false
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        self.updateMapRegion(location: mapLocation)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeIn) {
            mapRegion = location.coordinates
        }
    } // end of func
    
    func toggleLocationList() {
        withAnimation(.easeInOut ) {
            showLocationList.toggle()
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationList = false 
        }
    }
}
