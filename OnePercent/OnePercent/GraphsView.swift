//
//  GraphsView.swift
//  OnePercent
//
//  Created by Andrew Beers on 1/7/23.
//

import SwiftUI
import Charts

struct GraphsView: View {
    
    @Binding var values: [CategoryValue]
    
    var body: some View {
        if (values.count > 0){
            Chart(values) {
                LineMark(
                    x: .value("Month", $0.date),
                    y: .value("Value", $0.value))
                .foregroundStyle(by: .value("Name", $0.name))
            }
            .frame(width: 330, height: 200)
            .chartYScale(domain: values
                .min{a, b in a.value < b.value}!
                .value - 10...values
                .max{a, b in a.value < b.value}!
                .value + 10)
        }
        else{
            Text("No Data Yet!")
        }

    }
}

struct GraphsView_Previews: PreviewProvider {
    static var previews: some View {
        GraphsView(values: .constant(Category.allDataValues))
    }
}
