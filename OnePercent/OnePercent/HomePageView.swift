//
//  HomePageView.swift
//  OnePercent
//
//  Created by Andrew Beers on 1/7/23.
//

import SwiftUI

struct HomePageView: View {
    @Binding var categories: [Category]
    @Binding var values: [CategoryValue]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingSetupPanel = false
    @State private var lastDateOfInterest = Date(timeIntervalSince1970: 0)
    let saveAction: ()->Void
    var body: some View {
            VStack {
                Text("My Values")
                HStack {
                    
                    Button(action: {
                        lastDateOfInterest = Calendar.current.date(byAdding: .day, value: -7, to: Date())!
                    }) {
                        Text("1W")
                            .padding()
                    }
                    .buttonStyle(BlackButtonStyle())
                    Button(action: {
                        lastDateOfInterest = Calendar.current.date(byAdding: .month, value: -1, to: Date())!
                    }) {
                        Text("1M")
                            .padding()
                    }
                    .buttonStyle(BlackButtonStyle())
                    Button(action: {
                        lastDateOfInterest = Calendar.current.date(byAdding: .month, value: -3, to: Date())!
                    }) {
                        
                        Text("1Q")
                            .padding()
                    }
                    .buttonStyle(BlackButtonStyle())
                    Button(action: {
                        lastDateOfInterest = Calendar.current.date(byAdding: .year, value: -1, to: Date())!
                    }) {
                        
                        Text("1Y")
                            .padding()
                    }
                    .buttonStyle(BlackButtonStyle())
                    Button(action: {
                        lastDateOfInterest = Date(timeIntervalSince1970: 0)
                    }) {
                        
                        Text("All")
                            .padding()
                    }
                    .buttonStyle(BlackButtonStyle())
                }
                .padding()
                GraphsView(values: getValuesAfterDateOfInterest(
                    categoryValues: values,
                    lastDateOfInterest: lastDateOfInterest))
                UpdatesView(categories: $categories,
                            values: $values)
            }
            .padding()
            .navigationTitle("1%")
            .toolbar {
                Button(action: {
                    isPresentingSetupPanel = true
                }) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
            .sheet(isPresented: $isPresentingSetupPanel) {
                NavigationView {
                    SetupView(categories: $categories)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Dismiss") {
                                    isPresentingSetupPanel = false
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Add") {
                                    isPresentingSetupPanel = false
                                }
                            }
                        }
                }
            }
            .onChange(of: scenePhase) { phase in
                if phase == .inactive { saveAction() }
            }
    }
}

func getDurationButtonStyle(lastDateOfInterest: Date, myDate: Date) -> any ButtonStyle {
    return lastDateOfInterest == myDate ? GreenButtonStyle() : BlackButtonStyle()
}

func getValuesAfterDateOfInterest (categoryValues: [CategoryValue], lastDateOfInterest: Date) -> [CategoryValue] {
    return categoryValues.filter({lastDateOfInterest <= $0.date})
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView(categories: .constant(Category.firstSample),
                     values: .constant(Category.allDataValues),
                     saveAction: {})
    }
}
