//
//  GiphyHelper.swift
//  HealthJoy
//
//  Created by Daniel Espinosa on 7/20/22.
//

import UIKit
import Alamofire

class GifData: ObservableObject {
    
    @Published var gifs = [Gif]()
    
    var apiKey = ""
    
    // Tells if all records have been loaded. (Used to hide/show activity spinner)
    var listFull = false
    
    // Tracks last page loaded.
    var currentPage = 0
    
    // Limit of records per page.
    let perPage = 25
    
    var totalCount = 0
    
    var currentQuery = ""
    
    
    func searchGifs(query: String){
        resetPaginationDataIfNewQuery(query: query)
        let urlString = "https://api.giphy.com/v1/gifs/search"
        let parameters = ["api_key": apiKey, "q": query, "limit": "\(perPage)", "lang": "en", "offset": "\(currentPage)"]
        AF.request(urlString, method: .get, parameters: parameters).responseDecodable(of: GiphyResponse.self) { response in
            guard let giphyResponse = response.value else { return }
            guard let gifs = giphyResponse.data else { return }
            self.currentPage += 1
            self.addOnlyNewGifs(gifs: gifs)
            self.determineIfListIsFull(giphyResponse: giphyResponse)
        }
    }
    
    private func determineIfListIsFull(giphyResponse: GiphyResponse){
        if let totalCount = giphyResponse.pagination?.total_count {
            self.totalCount = totalCount
            self.listFull = (gifs.count < totalCount) ? false : true
        }
    }
    
    private func resetPaginationDataIfNewQuery(query: String){
        if (query != currentQuery){
            self.gifs = [Gif]()
            self.currentQuery = query
            self.totalCount = 0
            self.currentPage = 0
            self.listFull = false
        }
    }
    
    //Avoids Adding duplicate gifs to gifs
    private func addOnlyNewGifs(gifs: [Gif]){
        gifs.forEach { gif in
            if (!self.gifs.contains(gif)){
                self.gifs.append(gif)
            }
        }
    }
    
}
