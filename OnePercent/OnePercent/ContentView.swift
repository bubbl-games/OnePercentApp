////
////  ContentView.swift
////  OnePercent
////
////  Created by Andrew Beers on 12/23/22.
////
//
//import SwiftUI
//import Charts
//import Charts
//
//struct ContentView: View {
//    @State var firstCategories: [Category]
//    @State var secondCategories: [Category]
//
//    var londonWeatherData = [ WeatherData(year: 2021, month: 7, day: 1, temperature: 19.0),
//                              WeatherData(year: 2021, month: 8, day: 1, temperature: 17.0),
//                              WeatherData(year: 2021, month: 9, day: 1, temperature: 17.0),
//                              WeatherData(year: 2021, month: 10, day: 1, temperature: 13.0),
//                              WeatherData(year: 2021, month: 11, day: 1, temperature: 8.0),
//                              WeatherData(year: 2021, month: 12, day: 1, temperature: 8.0),
//                              WeatherData(year: 2022, month: 1, day: 1, temperature: 5.0),
//                              WeatherData(year: 2022, month: 2, day: 1, temperature: 8.0),
//                              WeatherData(year: 2022, month: 3, day: 1, temperature: 9.0),
//                              WeatherData(year: 2022, month: 4, day: 1, temperature: 11.0),
//                              WeatherData(year: 2022, month: 5, day: 1, temperature: 15.0),
//                              WeatherData(year: 2022, month: 6, day: 1, temperature: 18.0)
//    ]
//
//    var body: some View {
//        VStack{
//            HStack{
//                Button(action: {}){
//                    Text("All")
//                }
//                .foregroundColor(.white)
//                .frame(width: 100.0, height: 50.0)
//                .background(.black)
//                .cornerRadius(10)
//                .padding(15.0)
//                .shadow(color: .black, radius: 3, x:0, y:2)
//                Button(action: {}){
//                    Text("3M")
//                }
//                .foregroundColor(.white)
//                .frame(width: 100.0, height: 50.0)
//                .background(Color(hex: 0x6184FF))
//                .cornerRadius(10)
//                .padding(15.0)
//                .shadow(color: .black, radius: 3, x:0, y:2)
//                Button(action: {}){
//                    Text("1W")
//                }
//                .foregroundColor(.white)
//                .frame(width: 100.0, height: 50.0)
//                .background(.black)
//                .cornerRadius(10)
//                .padding(15.0)
//                .shadow(color: .black, radius: 3, x:0, y:2)
//            }
//            ForEach(Segment.segments) { segment in
//                VStack{
//                    Text(segment.name)
//                    let currentChartData = Category.allDataValues
//                        .filter({segment.categoryNames.contains($0.name)})
//                    Chart(currentChartData) {
//                        LineMark(
//                            x: .value("Month", $0.date),
//                            y: .value("Value", $0.value))
//                        .foregroundStyle(by: .value("Name", $0.name))
//                    }
//                    .frame(width: 330, height: 200)
//                    .chartYScale(domain: currentChartData
//                        .min{a, b in a.value < b.value}!
//                        .value - 10...currentChartData
//                        .max{a, b in a.value < b.value}!
//                        .value + 10)
//                }
//            }
//            HStack{
//                VStack {
//                    ForEach(firstCategories) { $category in
//                        Button(action: {}){
//                            Text(category.name)
//                        }
//                        .foregroundColor(category.textColor)
//                        .frame(width: 150.0, height: 40.0)
//                        .background(category.backgroundColor)
//                        .cornerRadius(10)
//                        .padding(10.0)
//                        .shadow(color: .black, radius: 3, x:0, y:2)
//
//                    }
//                }
//                VStack{
//                    ForEach(secondCategories) { $category in
//                        Button(action: {}){
//                            Text(category.name)
//                        }
//                        .foregroundColor(category.textColor)
//                        .frame(width: 150.0, height: 40.0)
//                        .background(category.backgroundColor)
//                        .cornerRadius(10)
//                        .padding(10)
//                        .shadow(color: .black, radius: 3, x:0, y:2)
//                    }
//                }
//
//            }
//            .padding()
//
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(firstCategories: Category.firstSample,
//                    secondCategories: Category.secondSample)
//    }
//}
//
//extension Color {
//    init(hex: UInt, alpha: Double = 1) {
//        self.init(
//            .sRGB,
//            red: Double((hex >> 16) & 0xff) / 255,
//            green: Double((hex >> 08) & 0xff) / 255,
//            blue: Double((hex >> 00) & 0xff) / 255,
//            opacity: alpha
//        )
//    }
//}
