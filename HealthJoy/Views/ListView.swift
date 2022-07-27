//
//  SearchView.swift
//  HealthJoy
//
//  Created by Daniel Espinosa on 7/20/22.
//

import SwiftUI

struct ListView: View {
    
    @State private var searchText = ""
    @EnvironmentObject var gifData: GifData
            
    var body: some View {
        VStack {
            if #available(iOS 15.0, *) {
                if (gifData.gifs.count < 1) {
                    Text("No Gifs to display")
                }
                List(){
                    ForEach(gifData.gifs) { gif in
                        GifContainerView(gif: gif)
                    }
                    if (gifData.listFull == false && searchText != "") {
                        ActivityIndicatorView()
                            .onAppear {
                                gifData.searchGifs(query: searchText)
                            }
                    }
                }
                .listStyle(.inset)
                .searchable(text: $searchText, prompt: "Enter Search Phrase")
                .onChange(of: searchText) { newValue in
                    gifData.searchGifs(query: searchText)
                }
                
            } else {
                // Fallback on earlier versions
            }
        }
        .navigationTitle("Search")
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
