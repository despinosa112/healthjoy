//
//  Gif.swift
//  HealthJoy
//
//  Created by Daniel Espinosa on 7/20/22.
//

import Foundation

struct Gif: Decodable, Identifiable, Equatable {
    
    static func == (lhs: Gif, rhs: Gif) -> Bool {
        return lhs.id == rhs.id
    }
    
    var type: String?
    var id: String?
    var url: String?
    var slug: String?
    var bitly_gif_url: String?
    var username: String?
    var source: String?
    var title: String?
    var embed_url: String?
    var user: User?
}
