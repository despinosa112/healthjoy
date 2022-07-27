//
//  GiphyResponse.swift
//  HealthJoy
//
//  Created by Daniel Espinosa on 7/20/22.
//

import Foundation

struct GiphyResponse: Decodable {
    var data: [Gif]?
    var pagination: Pagination?
    var meta: Meta?
}
