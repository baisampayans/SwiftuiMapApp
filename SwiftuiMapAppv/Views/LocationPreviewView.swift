//
//  LocationPreviewView.swift
//  SwiftuiMapAppv
//
//  Created by baisampayan saha on 6/9/24.
//

import SwiftUI

struct LocationPreviewView: View {
    
    let location: Location
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 16.0) {
                imageSection
                titleSection
            }//end of Vstack
            
            VStack(spacing: 8.0) {
                learnMoreButton
                nextButton
            }
        } //end of Hstack
        .padding(20)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 65)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        
    }//end of body
}

#Preview {
    LocationPreviewView(location: LocationsDataService.locations.first!)
}


extension LocationPreviewView {
    private var imageSection: some View {
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(6)
                    .background(.white )
                    .clipShape(RoundedRectangle(cornerRadius: 16 ))
            }
        }
    }// end of imagesection
    
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4.0) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var learnMoreButton: some View {
        Button(action: {
            
        }, label: {
            Text("Learn more")
                .font(.headline)
                .frame(width: 125, height: 35)
        })
        .buttonStyle(BorderedProminentButtonStyle())

    }
    
    private var nextButton: some View {
        Button(action: {
            vm.nextButtonPressed()
        }, label: {
            Text("Next")
                .font(.headline)
                .frame(width: 125, height: 35)
        })
        .buttonStyle(BorderedButtonStyle())
    }
}
