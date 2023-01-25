//
//  GraphsView.swift
//  OnePercent
//
//  Created by Andrew Beers on 1/24/23.
//

import SwiftUI
import Charts

struct GraphsView: View {
    var chartData:[GraphData]
    var body: some View {
        Chart(chartData) {
           LineMark(
               x: .value("Month", $0.date),
               y: .value("Value", $0.value))
           .foregroundStyle(by: .value("Name", $0.name))
       }
       .frame(width: 330, height: 200)
       .chartYScale(domain: 80...120)
    }
}

struct GraphsView_Previews: PreviewProvider {
    static var previews: some View {
        GraphsView(chartData: MapFromCategories(categories: Category.firstSample, lastDateOfInterest: Date(timeIntervalSince1970: 0)))
    }
}
