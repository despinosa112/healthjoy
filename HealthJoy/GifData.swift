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
    @Published var apiKey = "3SgxX2uiAckjlxRvZ3FbEpC144ZS5vEf"
    
    // Tells if all records have been loaded. (Used to hide/show activity spinner)
    var listFull = false
    
    // Tracks last page loaded. Used to load next page (current + 1)
    var currentPage = 0
    
    // Limit of records per page. (Only if backend supports, it usually does)
    let perPage = 25
    
    var totalCount = 0
    
    var currentQuery = ""
    
    
    func searchGifs(query: String){
        resetPaginationDataIfNeccessary(query: query)
        let urlString = "https://api.giphy.com/v1/gifs/search"
        let parameters = ["api_key": apiKey, "q": query, "limit": "\(perPage)", "lang": "en", "offset": "\(currentPage)"]
        print("-de-searchGifs query=\(query) params=\(parameters)")

        AF.request(urlString, method: .get, parameters: parameters).responseDecodable(of: GiphyResponse.self) { response in
            guard let giphyResponse = response.value else { return }
            guard let gifs = giphyResponse.data else { return }
            self.currentPage += 1
            self.gifs.append(contentsOf: gifs)
            
            if let totalCount = giphyResponse.pagination?.total_count {
                self.totalCount = totalCount
                self.listFull = (gifs.count < totalCount) ? false : true
            }
        }
    }
    
    private func resetPaginationDataIfNeccessary(query: String){
        if (query != currentQuery){
            print("-de-resetPaginationData")
            self.gifs = [Gif]()
            self.currentQuery = query
            self.totalCount = 0
            self.currentPage = 0
            self.listFull = false
        }
    }
    
    
    ///OLD
//    static func search(query: String, apiKey: String, completion: @escaping ([Gif]) -> ()){
//        let urlString = "https://api.giphy.com/v1/gifs/search"
//        let parameters = ["api_key": apiKey, "q": query, "limit": "10", "lang": "en"]
//        AF.request(urlString, method: .get, parameters: parameters).responseDecodable(of: GiphyResponse.self) { response in
//            guard let giphyResponse = response.value else { return }
//            guard let gifs = giphyResponse.data else { return }
//            completion(gifs)
//        }
//    }
        
        
    

}
