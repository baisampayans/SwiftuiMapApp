//
//  LocationMapAnnotationView.swift
//  SwiftuiMapAppv
//
//  Created by baisampayan saha on 6/10/24.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    
    var body: some View {
        VStack {
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundStyle(.white)
                .padding(6)
                .background(.red)
                .clipShape(Circle())
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 10, height: 10)
                .foregroundStyle(.accent)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -10)
                .padding(.bottom, 35)

        } //end of VStack
    }
}

#Preview {
    LocationMapAnnotationView()
}
