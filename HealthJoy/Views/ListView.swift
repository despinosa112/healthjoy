//
//  SearchView.swift
//  HealthJoy
//
//  Created by Daniel Espinosa on 7/20/22.
//

import SwiftUI

struct ListView: View {
    
    @State private var searchText = ""
    
    @State private var gifs: [Gif] = [Gif]()
    
    var apiKey: String


    
    var body: some View {
        VStack {
            if #available(iOS 15.0, *) {
                if (searchText == "") {
                    Text("Please Search For A Gif")
                }
                List (gifs){ gif in
                    GifContainerView(gif: gif)
                }
                .background(Color.green)
                .listStyle(.inset)
                .searchable(text: $searchText, prompt: "Enter Search Phrase")
                .onChange(of: searchText) { newValue in
                    GiphyHelper.search(query: searchText, apiKey: apiKey) { gifs in
                        self.gifs = gifs
                    }
                    
                }
                
            } else {
                // Fallback on earlier versions
            }
        }
        .navigationTitle("Search")
        .background(Color.yellow)

    }
}

//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView()
//    }
//}
