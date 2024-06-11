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
    @Published var span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
    @Published var cameraPosition: MapCameraPosition = .region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)))


    // show list of locations
    @Published var showLocationList: Bool = false
    
    // show location detail via sheet
    @Published var sheetLocation: Location? = nil
    
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        self.updateMapRegion(location: mapLocation)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeIn) {
//            mapRegion = location.coordinates
            cameraPosition = .region(MKCoordinateRegion(center: location.coordinates, span: span))
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
    
    func nextButtonPressed() {
        //get the current index
        guard let currentIndex = locations.firstIndex(where: { location in
            location == mapLocation
        }) else {
            return
        }
        
        //get next index
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            //next index is not valid
            //reset to first index
            guard let firstLocation = locations.first else { return }
            showNextLocation(location: firstLocation)
            return
        }
        
        //next index is valid
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation )
    }
}
