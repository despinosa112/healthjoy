//
//  ContentView.swift
//  HealthJoy
//
//  Created by Daniel Espinosa on 7/20/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var apiKey: String = ""
    @EnvironmentObject var gifData: GifData
    
    var body: some View {
        NavigationView {
            VStack {
                TextField(
                    "Please enter api key.",
                    text: $apiKey
                )
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                NavigationLink(destination: ListView()) {
                    Text("Proceed Text")
                }.simultaneousGesture(TapGesture().onEnded({ () in
                    gifData.apiKey = apiKey
                }))
                .padding()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
