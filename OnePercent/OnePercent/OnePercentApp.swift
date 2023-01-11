//
//  OnePercentApp.swift
//  OnePercent
//
//  Created by Andrew Beers on 12/23/22.
//

import SwiftUI

@main
struct OnePercentApp: App {
    @StateObject private var categoryStore = CategoryStore()
    @StateObject private var valueStore = ValueStore()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomePageView(categories: $categoryStore.categories,
                             values: $valueStore.values){
                    CategoryStore.save(categories: categoryStore.categories) { result in
                        if case .failure(let error) = result {
                            fatalError(error.localizedDescription)
                        }
                    }
                    ValueStore.save(values: valueStore.values){ result in
                        if case .failure(let error) = result {
                            fatalError(error.localizedDescription)
                        }
                    }
                }
            }
            .onAppear {
                CategoryStore.load { result in
                    switch result {
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    case .success(let categories):
                        categoryStore.categories = categories
                    }
                }
                
                ValueStore.load { result in
                    switch result {
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    case .success(let values):
                        valueStore.values = values
                    }
                }
            }
            
        }
    }
}
