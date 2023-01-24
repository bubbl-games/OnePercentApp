//
//  Data.swift
//  OnePercent
//
//  Created by Andrew Beers on 12/29/22.
//

import SwiftUI


struct Category: Identifiable, Codable {
    let id: UUID
    var name: String
    var theme: Theme
    
    init(id: UUID = UUID(), name: String, theme: Theme) {
        self.id = id
        self.name = name
        self.theme = theme
    }
    
    mutating func update(from category: Category) {
        name = category.name
        theme = category.theme
    }
}

extension Category {
    static let technicalGrowthData = [ CategoryValue(year: 2022, month: 1, day: 1, name: "Technical Growth", value: 115.56, delta: -1),
                                       CategoryValue(year: 2022, month: 1, day: 2, name: "Technical Growth", value: 116.72, delta: 1),
                                       CategoryValue(year: 2022, month: 1, day: 3, name: "Technical Growth", value: 117.89, delta: 1),
                                       CategoryValue(year: 2022, month: 1, day: 4, name: "Technical Growth", value: 119.07, delta: 1),
                                       CategoryValue(year: 2022, month: 1, day: 5, name: "Technical Growth", value: 120.26, delta: 1)
                                       ]
    
    static let jobData = [ CategoryValue(year: 2022, month: 1, day: 1, name: "Job", value: 100.62, delta: 0),
                           CategoryValue(year: 2022, month: 1, day: 2, name: "Job", value: 100.62, delta: 0),
                           CategoryValue(year: 2022, month: 1, day: 3, name: "Job", value: 101.62, delta: 1),
                           CategoryValue(year: 2022, month: 1, day: 4, name: "Job", value: 102.64, delta: 1),
                           CategoryValue(year: 2022, month: 1, day: 5, name: "Job", value: 103.67, delta: 1)]

    static let dietData = [ CategoryValue(year: 2022, month: 1, day: 1, name: "Diet", value: 88.25, delta: -1),
                            CategoryValue(year: 2022, month: 1, day: 2, name: "Diet", value: 89.13, delta: 1),
                            CategoryValue(year: 2022, month: 1, day: 3, name: "Diet", value: 90.02, delta: 1),
                            CategoryValue(year: 2022, month: 1, day: 4, name: "Diet", value: 89.12, delta: -1),
                            CategoryValue(year: 2022, month: 1, day: 5, name: "Diet", value: 90.01, delta: 1)]

    static let exerciseData = [ CategoryValue(year: 2022, month: 1, day: 1, name: "Exercise", value: 90.07, delta: -1),
                                CategoryValue(year: 2022, month: 1, day: 2, name: "Exercise", value: 90.97, delta: 1),
                                CategoryValue(year: 2022, month: 1, day: 3, name: "Exercise", value: 91.88, delta: 1),
                                CategoryValue(year: 2022, month: 1, day: 4, name: "Exercise", value: 92.80, delta: 1),
                                CategoryValue(year: 2022, month: 1, day: 5, name: "Exercise", value: 93.73, delta: 1)]

    static let sleepData = [ CategoryValue(year: 2022, month: 1, day: 1, name: "Sleep", value: 61.57, delta: -1),
                             CategoryValue(year: 2022, month: 1, day: 2, name: "Sleep", value: 60.95, delta: 1),
                             CategoryValue(year: 2022, month: 1, day: 3, name: "Sleep", value: 60.34, delta: 1),
                             CategoryValue(year: 2022, month: 1, day: 4, name: "Sleep", value: 60.95, delta: 1),
                             CategoryValue(year: 2022, month: 1, day: 5, name: "Sleep", value: 60.34, delta: 1)]

    static let mentalData = [ CategoryValue(year: 2022, month: 1, day: 1, name: "Mental", value: 91.85, delta: -1),
                              CategoryValue(year: 2022, month: 1, day: 2, name: "Mental", value: 92.77, delta: 1),
                              CategoryValue(year: 2022, month: 1, day: 3, name: "Mental", value: 93.70, delta: 1),
                              CategoryValue(year: 2022, month: 1, day: 4, name: "Mental", value: 92.76, delta: 1),
                              CategoryValue(year: 2022, month: 1, day: 5, name: "Mental", value: 91.83, delta: 1)]

    static let julieData = [ CategoryValue(year: 2022, month: 1, day: 1, name: "Julie", value: 153.12, delta: -1),
                             CategoryValue(year: 2022, month: 1, day: 2, name: "Julie", value: 154.65, delta: 1),
                             CategoryValue(year: 2022, month: 1, day: 3, name: "Julie", value: 156.20, delta: 1),
                             CategoryValue(year: 2022, month: 1, day: 4, name: "Julie", value: 154.64, delta: 1),
                             CategoryValue(year: 2022, month: 1, day: 5, name: "Julie", value: 153.09, delta: 1)]

    static let socialData = [ CategoryValue(year: 2022, month: 1, day: 1, name: "Social", value: 186.89, delta: -1),
                              CategoryValue(year: 2022, month: 1, day: 2, name: "Social", value: 188.76, delta: 1),
                              CategoryValue(year: 2022, month: 1, day: 3, name: "Social", value: 190.65, delta: 1),
                              CategoryValue(year: 2022, month: 1, day: 4, name: "Social", value: 192.56, delta: 1),
                              CategoryValue(year: 2022, month: 1, day: 5, name: "Social", value: 190.63, delta: 1)]

    static let financialData = [ CategoryValue(year: 2022, month: 1, day: 1, name: "Financial", value: 164.17, delta: -1),
                                 CategoryValue(year: 2022, month: 1, day: 2, name: "Financial", value: 165.81, delta: 1),
                                 CategoryValue(year: 2022, month: 1, day: 3, name: "Financial", value: 167.47, delta: 1),
                                 CategoryValue(year: 2022, month: 1, day: 4, name: "Financial", value: 165.79, delta: 1),
                                 CategoryValue(year: 2022, month: 1, day: 5, name: "Financial", value: 164.13, delta: 1)]

    static let russianData = [ CategoryValue(year: 2022, month: 1, day: 1, name: "Russian", value: 46.50, delta: -1),
                               CategoryValue(year: 2022, month: 1, day: 2, name: "Russian", value: 46.96, delta: 1),
                               CategoryValue(year: 2022, month: 1, day: 3, name: "Russian", value: 47.43, delta: 1),
                               CategoryValue(year: 2022, month: 1, day: 4, name: "Russian", value: 47.91, delta: 1),
                               CategoryValue(year: 2022, month: 1, day: 5, name: "Russian", value: 48.39, delta: 1)]
    
    static let allDataValues = technicalGrowthData + jobData + exerciseData + sleepData + dietData + mentalData + julieData + socialData + financialData + russianData;

    static let firstSample: [Category] =
    [
        Category(name: "Technical Growth", theme: .green),
        Category(name: "Job", theme:.red),
        Category(name: "Diet", theme:.cyan),
        Category(name: "Exercise", theme:.orange),
        Category(name: "Sleep", theme:.purple)
    ]
    
    static let secondSample: [Category] =
    [
        Category(name: "Mental", theme:.pink),
        Category(name: "Julie", theme:.yellow),
        Category(name: "Social", theme:.indigo),
        Category(name: "Financial", theme:.blue),
        Category(name: "Russian", theme:.gray)
    ]
}
