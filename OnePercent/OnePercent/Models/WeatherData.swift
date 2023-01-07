//
//  WeatherData.swift
//  OnePercent
//
//  Created by Andrew Beers on 12/29/22.
//

import Foundation

struct WeatherData: Identifiable {
    let id = UUID()
    let date: Date
    let temperature: Double
 
    init(year: Int, month: Int, day: Int, temperature: Double) {
        self.date = Calendar.current.date(from: .init(year: year, month: month, day: day)) ?? Date()
        self.temperature = temperature
    }
}
