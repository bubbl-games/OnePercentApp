//
//  Theme.swift
//  OnePercent
//
//  Created by Andrew Beers on 1/23/23.
//

import SwiftUI

enum Theme: String, CaseIterable, Identifiable, Codable {
    case black
    case blue
    case brown
    case cyan
    case gray
    case green
    case indigo
    case mint
    case orange
    case pink
    case purple
    case red
    case teal
    case yellow
    
    var accentColor: Color {
        switch self {
        case .cyan, .mint, .orange, .teal, .gray, .pink, .yellow: return .black
        case .indigo, .black, .blue, .brown, .green, .red, .purple: return .white
        }
    }
    var mainColor: Color{
        switch self {
        case .black: return Color.black
        case .blue: return Color.blue
        case .brown: return Color.brown
        case .cyan: return Color.cyan
        case .gray: return Color.gray
        case .green: return Color.green
        case .indigo: return Color.indigo
        case .mint: return Color.mint
        case .orange: return Color.orange
        case .pink: return Color.pink
        case .purple: return Color.purple
        case .red: return Color.red
        case .teal: return Color.teal
        case .yellow: return Color.yellow
        }
        
    }
    var name: String {
        rawValue.capitalized
    }
    var id: String {
        name
    }
}
