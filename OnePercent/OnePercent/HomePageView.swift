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
    
    let saveAction: ()->Void
    var body: some View {
            VStack {
//                NavigationLink(destination: GraphsView(values: $values)){
//                    MainButtonView(name: "Graphs", textColor: .red, backgroundColor: .yellow)
//
//                }
//                NavigationLink(destination: UpdatesView(categories: $categories,
//                                                        values: $values)){
//                    MainButtonView(name: "Updates", textColor: .red, backgroundColor: .yellow)
//
//                }
                Text("My Values")
                GraphsView(values: $values)
                UpdatesView(categories: $categories,                                            values: $values)
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

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView(categories: .constant(Category.firstSample), values: .constant(Category.allDataValues), saveAction: {})
    }
}
