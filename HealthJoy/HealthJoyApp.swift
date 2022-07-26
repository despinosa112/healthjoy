//
//  HealthJoyApp.swift
//  HealthJoy
//
//  Created by Daniel Espinosa on 7/20/22.
//

import SwiftUI

@main
struct HealthJoyApp: App {

    @StateObject private var gifData = GifData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(gifData)
        }
    }
}
