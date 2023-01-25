//
//  GraphData.swift
//  OnePercent
//
//  Created by Andrew Beers on 1/24/23.
//

import Foundation

struct GraphData: Identifiable, Codable, Equatable {
    let id: UUID
    var date: Date
    var value: Double
    var name: String
 
    init(id: UUID = UUID(), date: Date, value: Double, name: String) {
        self.id = id
        self.date = date
        self.value = value
        self.name = name
    }
}
