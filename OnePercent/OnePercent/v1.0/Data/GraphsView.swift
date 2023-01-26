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
    var categories: [Category]
    var minValue:Double
    var maxValue:Double
    
    var body: some View {
        Chart(chartData) {
           LineMark(
               x: .value("Month", $0.date),
               y: .value("Value", $0.value))
           .foregroundStyle(by: .value("Name", $0.name))
       }
       .frame(width: 330, height: 200)
       .chartYScale(domain: minValue...maxValue)
       //.chartForegroundStyleScale(CreateLineStyleDictionary(categories: categories))
    }
        
//    func CreateLineStyleDictionary(categories:[Category]) -> KeyValuePairs<String, Color> {
//        var pairs = KeyValuePairs<String, Color>()
//        var listOfPairs:[KeyValuePair<String,Color>] = []
//
//        KeyValuePair<String, Color> keyValuePair = new KeyValuePair<String, Color>(1, 2);
//        for category in categories {
//            listOfPairs.append(new KeyValuePair<String, Color>(category.name, category.theme.mainColor))
//        }
//
//        return new KeyValuePairs<String,Color>(listOfPairs)
//    }
}

struct GraphsView_Previews: PreviewProvider {
    static var previews: some View {
        GraphsView(chartData: MapFromCategories(categories: Category.firstSample, lastDateOfInterest: Date(timeIntervalSince1970: 0)), categories: Category.firstSample, minValue: 80, maxValue: 120)
    }
}
