//
//  UpdateCardView.swift
//  OnePercent
//
//  Created by Andrew Beers on 1/24/23.
//

import SwiftUI

struct UpdateCardView: View {
    @Binding var category:Category
    var body: some View {
        HStack{
            Text(category.name)
                .foregroundColor(category.theme.mainColor)
            Text(getNextDateString(categoryValues: category.values))
                .foregroundColor(category.theme.mainColor)
            Spacer()
            Button(action: {
                category.values.append(createCategoryValue(
                    categoryValues: category.values,
                    delta: 1))
            }) {
                Image(systemName: "arrow.up.circle")
            }
            .foregroundColor(.white)
            .padding(8)
            .background(.green)
            .cornerRadius(10)
            Button(action: {
                category.values.append(createCategoryValue(
                    categoryValues: category.values,
                    delta: -1))
            }) {
                Image(systemName: "arrow.down.circle")
            }
            .foregroundColor(.white)
            .padding(8)
            .background(.red)
            .cornerRadius(10)
            Button(action: {
                if (category.values.count > 0){
                    category.values.remove(at: category.values.count - 1)
                }
            }) {
                Image(systemName: "x.circle")
            }
            .foregroundColor(.white)
            .padding(8)
            .background(.black)
            .cornerRadius(10)
        }
        .padding(12)
        .frame(width: 330)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(category.theme.mainColor, lineWidth: 2)
        )
    }
}
func getNextDateString (categoryValues: [CategoryValue]) -> String {
    
    if (categoryValues.count == 0){
        return dateToMonthDayString(date: Date())
    }
    else {
        return dateToMonthDayString(date: categoryValues.last!.date)
    }
}


func dateToMonthDayString(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "MM"
    let month = formatter.string(from: date)
    formatter.dateFormat = "dd"
    let day = formatter.string(from: date)
    return String(month) + "/" + String(day)
}

func createCategoryValue (categoryValues: [CategoryValue], delta: Int) -> CategoryValue {
    var categoryValue = CategoryValue(delta: delta)
    let offset = delta > 0 ? 1.01 : 0.99
    if (!categoryValues.isEmpty){
        let nextValueDate = Calendar.current.date(byAdding: .day, value: 1, to: categoryValues.last!.date)!
        categoryValue.date = nextValueDate
        categoryValue.value = categoryValues.last!.value * offset
    }
    else {
        categoryValue.date = Calendar.current.date(from: .init(year: 2023, month: 1, day: 1))!
        categoryValue.value = 100 * offset
    }
    
    return categoryValue
}

struct UpdateCardView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateCardView(category: .constant(Category.firstSample[1]))
    }
}
