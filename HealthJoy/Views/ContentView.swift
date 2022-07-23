//
//  ContentView.swift
//  HealthJoy
//
//  Created by Daniel Espinosa on 7/20/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        NavigationView {
            Text("iOS 13 SUCCESS")
                .padding()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
