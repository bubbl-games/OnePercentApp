//
//  CategoryValue.swift
//  OnePercent
//
//  Created by Andrew Beers on 1/5/23.
//

import Foundation


struct CategoryValue: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var date: Date
    var value: Double
    var delta: Int
 
    init(id: UUID = UUID(), year: Int, month: Int, day: Int, name: String, value: Double, delta: Int) {
        self.id = id
        self.date = Calendar.current.date(from: .init(year: year, month: month, day: day)) ?? Date()
        self.value = value
        self.delta = delta
        self.name = name
    }
    
    init(id: UUID = UUID(), name: String, delta: Int){
        self.id = id
        self.name = name
        self.delta = delta
        self.value = 0
        self.date = Date()
    }
}
