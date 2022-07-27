//
//  User.swift
//  HealthJoy
//
//  Created by Daniel Espinosa on 7/20/22.
//

import Foundation

struct User: Decodable {
    var avatar_url: String?
    var username: String?
    var display_name: String?
    
    var compUserName: String? {
        return username != nil ? "@\(username!)" : "anonymous user"
    }
}
