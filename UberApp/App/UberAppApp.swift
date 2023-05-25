//
//  UberAppApp.swift
//  UberApp
//
//  Created by Kevin Hernandez on 19/05/23.
//

import SwiftUI

@main
struct UberAppApp: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
        }
    }
}
