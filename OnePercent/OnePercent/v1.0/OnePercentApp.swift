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
//    @StateObject private var valueStore = ValueStore()
    
    @State private var viewType = 1
    
    var body: some Scene {
        WindowGroup {
            VStack {
                if (viewType == 1){
                    CategoriesView(categories: .constant([]))
                }
                else if (viewType == 2){
                    UpdatesView(categories: .constant([]))
                }
                else{
                    DataView()
                }
            }
            .toolbar {
                FooterToolbar(switchToCategories: { viewType = 1 }, switchToUpdates: { viewType = 2 }, switchToData: { viewType = 3 })
            }
//            NavigationView {
//                HomePageView(categories: $categoryStore.categories,
//                             values: $valueStore.values){
//                    CategoryStore.save(categories: categoryStore.categories) { result in
//                        if case .failure(let error) = result {
//                            fatalError(error.localizedDescription)
//                        }
//                    }
//                    ValueStore.save(values: valueStore.values){ result in
//                        if case .failure(let error) = result {
//                            fatalError(error.localizedDescription)
//                        }
//                    }
//                }
//                TableView(categories: categoryStore.categories,
//                            values: valueStore.values)
//            }
            .onAppear {
                CategoryStore.load { result in
                    switch result {
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    case .success(let categories):
                        categoryStore.categories = categories
                    }
                }
            }
            
        }
    }
}
