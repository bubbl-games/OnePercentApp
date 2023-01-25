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
    @State private var viewType = 1
    
    var body: some Scene {
        WindowGroup {
            VStack {
                if (viewType == 1){
                    CategoriesView(categories: $categoryStore.categories)
                }
                else if (viewType == 2){
                    UpdatesView(categories: $categoryStore.categories)
                }
                else{
                    DataView(categories: categoryStore.categories)
                }
            }
            .toolbar {
                FooterToolbar(switchToCategories: { viewType = 1; save() }, switchToUpdates: { viewType = 2; save() }, switchToData: { viewType = 3; save() })
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
            }
            
        }
    }
    
    func save(){
        CategoryStore.save(categories: categoryStore.categories) { result in
            if case .failure(let error) = result {
                fatalError(error.localizedDescription)
            }
        }
    }
}
