//
//  GridView.swift
//  OnePercent
//
//  Created by Andrew Beers on 1/24/23.
//

import SwiftUI

struct GridView: View {
    var categories:[Category]
    var weekMonthQuarter:Int = 3
    
    var body: some View {
        Grid(alignment: .topLeading,
        horizontalSpacing: 50) {
            GridRow {
                if (weekMonthQuarter == 1){
                    Text("Weekly Changes")
                }
                else if(weekMonthQuarter == 2){
                    Text("Monthly Changes")
                }
                else {
                    Text("Quarterly Changes")
                }
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }
            ForEach(categories) { category in
                Divider()
                    .gridCellUnsizedAxes(.horizontal)
                GridRow {
                    /*@START_MENU_TOKEN@*/Text(category.name)/*@END_MENU_TOKEN@*/
                        .foregroundColor(category.theme.mainColor)
                    Text(GetPerformance(values: category.values, dateOfInterest:GetDateForPerformance(lastValue: category.values.last, weekMonthQuarter: weekMonthQuarter, count: 1)))
                    Text(GetPerformance(values: category.values, dateOfInterest:GetDateForPerformance(lastValue: category.values.last, weekMonthQuarter: weekMonthQuarter, count: 2)))
                    Text(GetPerformance(values: category.values, dateOfInterest:GetDateForPerformance(lastValue: category.values.last, weekMonthQuarter: weekMonthQuarter, count: 3)))
                }
            }
        }
    }
    func GetDateForPerformance(lastValue: CategoryValue?, weekMonthQuarter: Int, count: Int) -> Date{
        if (lastValue == nil){
            return Date()
        }
        if (weekMonthQuarter == 1){
            return Calendar.current.date(byAdding: .day, value: -7 * count, to: lastValue!.date)!
        }
        else if (weekMonthQuarter == 2){
            return Calendar.current.date(byAdding: .month, value: -1 * count, to: lastValue!.date)!
        }
        else {
            return Calendar.current.date(byAdding: .month, value: -3 * count, to: lastValue!.date)!
        }
    }
    
    
    func GetPerformance(values: [CategoryValue], dateOfInterest: Date) -> String{
        if (values.count == 0){
            return "-"
        }
        
        let categoryValueOnDateOfInterest = values.first(where:{Calendar.current.isDate($0.date, equalTo: dateOfInterest, toGranularity: .day)})
        if (categoryValueOnDateOfInterest == nil){
            return "-"
        }
        else {
            let percentChange = ((values.last!.value - categoryValueOnDateOfInterest!.value) / values.last!.value) * 100
            return String(format: "%.1f", percentChange) + "%"
        }
    }
}
                        


struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(categories: Category.firstSample)
    }
}
