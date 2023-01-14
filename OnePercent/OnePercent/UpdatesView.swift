//
//  UpdatesView.swift
//  OnePercent
//
//  Created by Andrew Beers on 1/7/23.
//

import SwiftUI

struct GreenButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? Color.green : Color.white)
            .background(configuration.isPressed ? Color.white : Color.green)
            .cornerRadius(6.0)
            .padding(20)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct RedButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? Color.red : Color.white)
            .background(configuration.isPressed ? Color.white : Color.red)
            .cornerRadius(6.0)
            .padding(.trailing)
            .frame(maxWidth: .infinity, alignment: .center)
    }
}

struct BlackButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? Color.black : Color.white)
            .background(configuration.isPressed ? Color.white : Color.black)
            .cornerRadius(6.0)
            .padding(.trailing)
            .frame(maxWidth: .infinity, alignment: .trailing)
        
    }
}

struct UpdatesView: View {
    @Binding var categories: [Category]
    @Binding var values: [CategoryValue]
    var dateFormatter = DateFormatter()
    let today = Date()
    let myCalendar = Calendar.current
    var body: some View {
        
        let _ = dateFormatter.dateStyle = .long
        List{
            ForEach(categories) { category in
                let categoryValues = values.filter({category.name == $0.name})
                VStack {
                    Text(category.name)
                        .frame(alignment: .center)
                    HStack {
                        
                        Button(action: {
                            values.append(createCategoryValue(
                                categoryValues: categoryValues,
                                categoryName: category.name,
                                delta: 1))
                        }) {
                            Image(systemName: "arrow.up.circle")
                                .padding()
                        }
                        .buttonStyle(GreenButtonStyle())
                        Button(action: {
                            values.append(createCategoryValue(
                                categoryValues: categoryValues,
                                categoryName: category.name,
                                delta: -1))
                        }) {
                            Image(systemName: "arrow.down.circle")
                                .padding()
                        }
                        .buttonStyle(RedButtonStyle())
                        Button(action: {
                            if (categoryValues.count > 0){
                                let index = values.firstIndex(of: categoryValues.last!)
                                values.remove(at: index!)
                            }
                        }) {
                            
                            Image(systemName: "x.circle")
                                .padding()
                        }
                        .buttonStyle(BlackButtonStyle())
                    }
                    .padding()
                    Text(getDescription(categoryValues: categoryValues, dateFormatter: dateFormatter))
                }
            }
        }
    }
}

func createCategoryValue (categoryValues: [CategoryValue], categoryName: String, delta: Int) -> CategoryValue {
    var categoryValue = CategoryValue(name: categoryName, delta: delta)
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
                
func getDescription (categoryValues: [CategoryValue], dateFormatter: DateFormatter) -> String {
    var description = ""
    if (!categoryValues.isEmpty){
        let lastValue = categoryValues.last!
        description = "Date: " + dateFormatter.string(from: lastValue.date) + " Value: " + String(format: "%0.2f",lastValue.value)
    }
    else {
        description = "No Data Yet"
    }
                    
    return description
                        
}



struct UpdatesView_Previews: PreviewProvider {
    static var previews: some View {
        UpdatesView(categories: .constant(Category.firstSample), values: .constant(Category.allDataValues))
    }
}
