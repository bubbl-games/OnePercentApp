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
    var values: [CategoryValue]
    
    init(id: UUID = UUID(), name: String, theme: Theme, values: [CategoryValue]) {
        self.id = id
        self.name = name
        self.theme = theme
        self.values = values
    }
    
    mutating func update(from category: Category) {
        name = category.name
        theme = category.theme
    }
}

extension Category {
    static let technicalGrowthData = [ CategoryValue(year: 2022, month: 1, day: 1,  value: 115.56, delta: -1),
                                       CategoryValue(year: 2022, month: 1, day: 2,  value: 116.72, delta: 1),
                                       CategoryValue(year: 2022, month: 1, day: 3,  value: 117.89, delta: 1),
                                       CategoryValue(year: 2022, month: 1, day: 4,  value: 119.07, delta: 1),
                                       CategoryValue(year: 2022, month: 1, day: 5, value: 120.26, delta: 1)
                                       ]
    
    static let jobData = [ CategoryValue(year: 2022, month: 1, day: 1, value: 100.62, delta: 0),
                           CategoryValue(year: 2022, month: 1, day: 2,  value: 100.62, delta: 0),
                           CategoryValue(year: 2022, month: 1, day: 3,value: 101.62, delta: 1),
                           CategoryValue(year: 2022, month: 1, day: 4,  value: 102.64, delta: 1),
                           CategoryValue(year: 2022, month: 1, day: 5, value: 103.67, delta: 1)]

    static let dietData = [ CategoryValue(year: 2022, month: 1, day: 1,  value: 88.25, delta: -1),
                            CategoryValue(year: 2022, month: 1, day: 2,  value: 89.13, delta: 1),
                            CategoryValue(year: 2022, month: 1, day: 3,  value: 90.02, delta: 1),
                            CategoryValue(year: 2022, month: 1, day: 4, value: 89.12, delta: -1),
                            CategoryValue(year: 2022, month: 1, day: 5,  value: 90.01, delta: 1)]

    static let exerciseData = [ CategoryValue(year: 2022, month: 1, day: 1,  value: 90.07, delta: -1),
                                CategoryValue(year: 2022, month: 1, day: 2,  value: 90.97, delta: 1),
                                CategoryValue(year: 2022, month: 1, day: 3,  value: 91.88, delta: 1),
                                CategoryValue(year: 2022, month: 1, day: 4, value: 92.80, delta: 1),
                                CategoryValue(year: 2022, month: 1, day: 5,  value: 93.73, delta: 1)]

    static let sleepData = [ CategoryValue(year: 2022, month: 1, day: 1,value: 61.57, delta: -1),
                             CategoryValue(year: 2022, month: 1, day: 2,  value: 60.95, delta: 1),
                             CategoryValue(year: 2022, month: 1, day: 3,  value: 60.34, delta: 1),
                             CategoryValue(year: 2022, month: 1, day: 4,  value: 60.95, delta: 1),
                             CategoryValue(year: 2022, month: 1, day: 5, value: 60.34, delta: 1)]

    static let mentalData = [ CategoryValue(year: 2022, month: 1, day: 1, value: 91.85, delta: -1),
                              CategoryValue(year: 2022, month: 1, day: 2,  value: 92.77, delta: 1),
                              CategoryValue(year: 2022, month: 1, day: 3,  value: 93.70, delta: 1),
                              CategoryValue(year: 2022, month: 1, day: 4,  value: 92.76, delta: 1),
                              CategoryValue(year: 2022, month: 1, day: 5,  value: 91.83, delta: 1)]

    static let julieData = [ CategoryValue(year: 2022, month: 1, day: 1,  value: 153.12, delta: -1),
                             CategoryValue(year: 2022, month: 1, day: 2,  value: 154.65, delta: 1),
                             CategoryValue(year: 2022, month: 1, day: 3,  value: 156.20, delta: 1),
                             CategoryValue(year: 2022, month: 1, day: 4, value: 154.64, delta: 1),
                             CategoryValue(year: 2022, month: 1, day: 5, value: 153.09, delta: 1)]

    static let socialData = [ CategoryValue(year: 2022, month: 1, day: 1,  value: 186.89, delta: -1),
                              CategoryValue(year: 2022, month: 1, day: 2,  value: 188.76, delta: 1),
                              CategoryValue(year: 2022, month: 1, day: 3,  value: 190.65, delta: 1),
                              CategoryValue(year: 2022, month: 1, day: 4,  value: 192.56, delta: 1),
                              CategoryValue(year: 2022, month: 1, day: 5,  value: 190.63, delta: 1)]

    static let financialData = [ CategoryValue(year: 2022, month: 1, day: 1,  value: 164.17, delta: -1),
                                 CategoryValue(year: 2022, month: 1, day: 2,  value: 165.81, delta: 1),
                                 CategoryValue(year: 2022, month: 1, day: 3,  value: 167.47, delta: 1),
                                 CategoryValue(year: 2022, month: 1, day: 4,  value: 165.79, delta: 1),
                                 CategoryValue(year: 2022, month: 1, day: 5,  value: 164.13, delta: 1)]

    static let russianData = [ CategoryValue(year: 2022, month: 1, day: 1,  value: 46.50, delta: -1),
                               CategoryValue(year: 2022, month: 1, day: 2, value: 46.96, delta: 1),
                               CategoryValue(year: 2022, month: 1, day: 3,  value: 47.43, delta: 1),
                               CategoryValue(year: 2022, month: 1, day: 4, value: 47.91, delta: 1),
                               CategoryValue(year: 2022, month: 1, day: 5, value: 48.39, delta: 1)]
    
    static let allDataValues = technicalGrowthData + jobData + exerciseData + sleepData + dietData + mentalData + julieData + socialData + financialData + russianData;

    static let firstSample: [Category] =
    [
        Category(name: "Technical Growth", theme: .green, values: Category.technicalGrowthData),
        Category(name: "Job", theme:.red, values: Category.jobData),
        Category(name: "Diet", theme:.cyan, values: Category.dietData),
        Category(name: "Exercise", theme:.orange, values: Category.exerciseData),
        Category(name: "Sleep", theme:.purple, values: Category.sleepData)
    ]
    
    static let secondSample: [Category] =
    [
        Category(name: "Mental", theme:.pink, values: Category.mentalData),
        Category(name: "Julie", theme:.yellow, values: Category.julieData),
        Category(name: "Social", theme:.indigo, values: Category.socialData),
        Category(name: "Financial", theme:.blue, values: Category.financialData),
        Category(name: "Russian", theme:.gray, values: Category.russianData)
    ]
}
