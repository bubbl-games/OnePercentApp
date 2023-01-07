//
//  Segment.swift
//  OnePercent
//
//  Created by Andrew Beers on 1/5/23.
//

import Foundation

struct Segment: Identifiable {
    let id: UUID
    var name: String
    var categoryNames: [String]
    
    init(id: UUID = UUID(), name: String, categoryNames: [String]) {
        self.id = id
        self.name = name
        self.categoryNames = categoryNames
    }
}


extension Segment {
    
    static let healthSegment = Segment(name: "Health", categoryNames: ["Exercise", "Sleep", "Mental", "Diet"])
    static let careerSegment = Segment(name: "Career", categoryNames: ["Technical Growth", "Job"])
    static let personalSegment = Segment(name: "Personal", categoryNames: ["Julie", "Social", "Financial", "Russian"])
    
    static let segments = [healthSegment]
    
}
