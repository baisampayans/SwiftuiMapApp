//
//  LocationsListView.swift
//  SwiftuiMapAppv
//
//  Created by baisampayan saha on 6/9/24.
//

import SwiftUI

struct LocationsListView: View {
    
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        List {
            ForEach(vm.locations) { location in
                Button(action: {
                    vm.showNextLocation(location: location)
                }, label: {
                    listRowView(location: location)
                })
                    .padding(.vertical, 4)
                    .listRowBackground(Color.clear)
            } //end of Foreach
        }//end of list
        .listStyle(.plain)
    }
}

#Preview {
    LocationsListView()
        .environmentObject(LocationViewModel())
}

extension LocationsListView {
    private func listRowView(location: Location) -> some View {
        HStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .clipShape(RoundedRectangle(cornerRadius: 10 ))
            }
            
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            } //end of Vstack
            .frame(maxWidth: .infinity, alignment: .leading )
        } //end of HStack
    }
}
