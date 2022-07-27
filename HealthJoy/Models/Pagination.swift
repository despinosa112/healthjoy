//
//  Pagination.swift
//  HealthJoy
//
//  Created by Daniel Espinosa on 7/20/22.
//

import Foundation

struct Pagination: Decodable {
    var total_count: Int?
    var count: Int?
    var offset: Int?
}
