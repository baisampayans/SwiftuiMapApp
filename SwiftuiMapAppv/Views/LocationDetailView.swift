//
//  LocationDetailView.swift
//  SwiftuiMapAppv
//
//  Created by baisampayan saha on 6/10/24.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    
    let location: Location
    @EnvironmentObject private var vm: LocationViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack {
                imageSection
                    .shadow(color: .black.opacity(0.3 ), radius: 20, x: 0, y: 10)
                
                VStack(alignment: .leading, spacing: 16, content: {
                    titleSection
                    Divider()
                    descriptionSection
                    Divider()
                    mapLayer
                }) // end of vstack
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
               
            }//end of Vstack
        }//end of Scrollview
        .ignoresSafeArea()
        .background(Material.ultraThin)
        .overlay(alignment: .topLeading) {
            backButton
        }
    }//end of body
}

#Preview {
    LocationDetailView(location: LocationsDataService.locations.first!)
        .environmentObject(LocationViewModel())
}

extension LocationDetailView {
    private var imageSection: some View {
        TabView {
            ForEach(location.imageNames, id: \.self ) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            }
        }//end of Tabview
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 8, content: {
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(location.cityName)
                .font(.title3)
                .foregroundStyle(.secondary)
        })
    }
    
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 8, content: {
            Text(location.description)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            
            if let url = URL(string: location.link) {
                Link("Read more on Wikipedia", destination: url)
                    .font(.headline)
                    .tint(.blue )
            }
        })
    }
    
    
    private var mapLayer: some View {
        Map(position: .constant(vm.cameraPosition)) {
            Annotation(vm.mapLocation.name, coordinate: vm.mapLocation.coordinates) {
                LocationMapAnnotationView()
            }
        }
        .allowsHitTesting(false)
        .aspectRatio(1, contentMode: .fit)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    
    private var backButton: some View {
        Button(action: {
            dismiss()
        }, label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .foregroundStyle(.black)
                .background(.thinMaterial)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .shadow(radius: 4)
                .padding()
        })
    }
    
}
