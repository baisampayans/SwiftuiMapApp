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
            
            Map(position: $vm.cameraPosition) {
                Annotation(vm.mapLocation.name, coordinate: vm.mapLocation.coordinates) {
                                    LocationMapAnnotationView()
                                }
            }
            .mapControls {
                MapCompass()
                MapPitchToggle()
                MapUserLocationButton()
            }
            
           
            VStack {
                header
                    .padding()
                
                Spacer()
                
                ZStack {
                    ForEach(vm.locations) { location in
                        ZStack {
                            if vm.mapLocation == location {
                                LocationPreviewView(location: location)
                                    .shadow(color: .black.opacity(0.3), radius: 20)
                                    .padding()
                                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading )))
                            }
                        }
                    }
                }
            } // end of Vstack
            
        } //end of Zstack
        .sheet(item: $vm.sheetLocation, onDismiss: nil) { location in
            LocationDetailView(location: location)
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
