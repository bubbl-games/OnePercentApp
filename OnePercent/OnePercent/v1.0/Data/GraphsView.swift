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
           .interpolationMethod(.catmullRom)
       }
       .frame(width: 330, height: 200)
       .chartYScale(domain: minValue...maxValue)
       .chartForegroundStyleScale(CreateLineStyleDictionary(categories: categories))
    }
        
    func CreateLineStyleDictionary(categories:[Category]) -> KeyValuePairs<String, Color> {
        if (categories.count == 0){
            return [:]
        }
        else if (categories.count == 1){
            return [categories[0].name : categories[0].theme.mainColor]
        }
        else if (categories.count == 2){
            return [categories[0].name : categories[0].theme.mainColor,
                    categories[1].name : categories[1].theme.mainColor]
        }
        else if (categories.count == 3){
            return [categories[0].name : categories[0].theme.mainColor,
                    categories[1].name : categories[1].theme.mainColor,
                    categories[2].name : categories[2].theme.mainColor]
        }
        else if (categories.count == 4){
            return [categories[0].name : categories[0].theme.mainColor,
                    categories[1].name : categories[1].theme.mainColor,
                    categories[2].name : categories[2].theme.mainColor,
                    categories[3].name : categories[3].theme.mainColor]
        }
        else if (categories.count == 5){
            return [categories[0].name : categories[0].theme.mainColor,
                    categories[1].name : categories[1].theme.mainColor,
                    categories[2].name : categories[2].theme.mainColor,
                    categories[3].name : categories[3].theme.mainColor,
                    categories[4].name : categories[4].theme.mainColor]
        }
        else if (categories.count == 6){
            return [categories[0].name : categories[0].theme.mainColor,
                    categories[1].name : categories[1].theme.mainColor,
                    categories[2].name : categories[2].theme.mainColor,
                    categories[3].name : categories[3].theme.mainColor,
                    categories[4].name : categories[4].theme.mainColor,
                    categories[5].name : categories[5].theme.mainColor]
        }
        else if (categories.count == 7){
            return [categories[0].name : categories[0].theme.mainColor,
                    categories[1].name : categories[1].theme.mainColor,
                    categories[2].name : categories[2].theme.mainColor,
                    categories[3].name : categories[3].theme.mainColor,
                    categories[4].name : categories[4].theme.mainColor,
                    categories[5].name : categories[5].theme.mainColor,
                    categories[6].name : categories[6].theme.mainColor]
        }
        else if (categories.count == 8){
            return [categories[0].name : categories[0].theme.mainColor,
                    categories[1].name : categories[1].theme.mainColor,
                    categories[2].name : categories[2].theme.mainColor,
                    categories[3].name : categories[3].theme.mainColor,
                    categories[4].name : categories[4].theme.mainColor,
                    categories[5].name : categories[5].theme.mainColor,
                    categories[6].name : categories[6].theme.mainColor,
                    categories[7].name : categories[7].theme.mainColor]
        }
        else if (categories.count == 9){
            return [categories[0].name : categories[0].theme.mainColor,
                    categories[1].name : categories[1].theme.mainColor,
                    categories[2].name : categories[2].theme.mainColor,
                    categories[3].name : categories[3].theme.mainColor,
                    categories[4].name : categories[4].theme.mainColor,
                    categories[5].name : categories[5].theme.mainColor,
                    categories[6].name : categories[6].theme.mainColor,
                    categories[7].name : categories[7].theme.mainColor,
                    categories[8].name : categories[8].theme.mainColor]
        }
        else {
            return [categories[0].name : categories[0].theme.mainColor,
                    categories[1].name : categories[1].theme.mainColor,
                    categories[2].name : categories[2].theme.mainColor,
                    categories[3].name : categories[3].theme.mainColor,
                    categories[4].name : categories[4].theme.mainColor,
                    categories[5].name : categories[5].theme.mainColor,
                    categories[6].name : categories[6].theme.mainColor,
                    categories[7].name : categories[7].theme.mainColor,
                    categories[8].name : categories[8].theme.mainColor,
                    categories[9].name : categories[9].theme.mainColor]
        }
    }
}

struct GraphsView_Previews: PreviewProvider {
    static var previews: some View {
        GraphsView(chartData: MapFromCategories(categories: Category.firstSample, lastDateOfInterest: Date(timeIntervalSince1970: 0)), categories: Category.firstSample, minValue: 80, maxValue: 120)
    }
}
