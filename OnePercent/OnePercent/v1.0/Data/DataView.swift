//
//  DataView.swift
//  OnePercent
//
//  Created by Andrew Beers on 1/23/23.
//

import SwiftUI
import Charts

struct DataView: View {
    @State var isGraph:Bool = false
    var categories: [Category]
    @State private var lastDateOfInterest = Date(timeIntervalSince1970: 0)
    @State private var weekMonthQuarter = 1
    
    var body: some View {
        if (categories.count == 0){
            Text("Create categories and make updates to see data")
                .font(.headline)
        }
        else{
            VStack{
                Spacer()
                HStack{
                    Button(action: {lastDateOfInterest = Calendar.current.date(byAdding: .day, value: -7, to: Date())!; weekMonthQuarter = 1}){
                        Text("Week")
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(10)
                    Button(action: {lastDateOfInterest = Calendar.current.date(byAdding: .month, value: -1, to: Date())!; weekMonthQuarter = 2}){
                        Text("Month")
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(10)
                    Button(action: {lastDateOfInterest = Calendar.current.date(byAdding: .month, value: -3, to: Date())!; weekMonthQuarter = 3}){
                        Text("Quarter")
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(10)
                }
                Spacer()
                if (isGraph){
                    let currentGraphData = MapFromCategories(categories: categories, lastDateOfInterest: lastDateOfInterest)
                    let minValue = currentGraphData.count == 0 ? 80 : currentGraphData.min{a, b in a.value < b.value}!.value - 5
                    let maxValue = currentGraphData.count == 0 ? 120 : currentGraphData.max{a, b in a.value < b.value}!.value + 5
                    GraphsView(chartData: currentGraphData, categories: categories, minValue: minValue, maxValue: maxValue)
                }
                else{
                    GridView(categories: categories, weekMonthQuarter: weekMonthQuarter)
                }
                Spacer()
                Button(action:{isGraph = !isGraph}){
                    if (isGraph){
                        Text("Switch To Table")
                            .padding()
                            .background(.black)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    else {
                        Text("Switch To Graph")
                            .padding()
                            .background(.black)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                }
                Spacer()
            }

        }
        
    }
}

func MapFromCategories(categories: [Category], lastDateOfInterest: Date) -> [GraphData]{
    var graphData:[GraphData] = []
    
    for category in categories {
        for value in category.values {
            if (value.date > lastDateOfInterest){
                graphData.append(GraphData(date: value.date, value: value.value, name: category.name))
            }
        }
    }
    
    return graphData
}

struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        DataView(categories: Category.firstSample)
    }
}
