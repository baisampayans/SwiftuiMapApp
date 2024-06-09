//
//  SwiftuiMapAppvApp.swift
//  SwiftuiMapAppv
//
//  Created by baisampayan saha on 6/7/24.
//

import SwiftUI

@main
struct SwiftuiMapAppvApp: App {
    
    @StateObject private var vm: LocationViewModel = LocationViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationView()
                .environmentObject(vm)
        } 
        
    }
}
