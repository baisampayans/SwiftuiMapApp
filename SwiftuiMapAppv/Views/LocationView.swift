//
//  LocationView.swift
//  SwiftuiMapAppv
//
//  Created by baisampayan saha on 6/7/24.
//

import SwiftUI
import MapKit

struct LocationView: View {
     
    @EnvironmentObject private var vm: LocationViewModel
    
     
    var body: some View {
        ZStack {
//            Map(coordinateRegion: $mapRegion)
            Map {
                Marker(vm.mapLocation.name, coordinate: vm.mapRegion)
            }// end of map
            .mapStyle(.hybrid(elevation: .realistic))
           
            VStack {
                header
                    .padding()
                
                
                
                Spacer()
            } // end of Vstack
            
        }
    }// end of body
}

#Preview {
    LocationView()
        .environmentObject(LocationViewModel() )
}

extension LocationView {
    private var header: some View {
        VStack {
            Button(action: vm.toggleLocationList, label: {
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: vm.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundStyle(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.showLocationList ? 180 : 0))
                    }
            })
            
            if vm.showLocationList {
                LocationsListView() 
            }
           
             
        } // end of Vstack
        .background(.thickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .black.opacity(0.3), radius: 15, x: 0, y: 15)
      
        
    }
}
