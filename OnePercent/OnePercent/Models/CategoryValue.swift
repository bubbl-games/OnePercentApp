//
//  CategoryValue.swift
//  OnePercent
//
//  Created by Andrew Beers on 1/5/23.
//

import Foundation


struct CategoryValue: Identifiable {
    let id = UUID()
    let name: String
    let date: Date
    let value: Double
    let delta: Int
 
    init(year: Int, month: Int, day: Int, name: String, value: Double, delta: Int) {
        self.date = Calendar.current.date(from: .init(year: year, month: month, day: day)) ?? Date()
        self.value = value
        self.delta = delta
        self.name = name
    }
}
