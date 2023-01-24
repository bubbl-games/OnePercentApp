//
//  CategoriesView.swift
//  OnePercent
//
//  Created by Andrew Beers on 1/23/23.
//

import SwiftUI

struct CategoriesView: View {
    @State var categories: [Category]
    @State private var isShowingEditSheet = false
    
    var body: some View {
        NavigationView{
            VStack {
                if (categories.count == 0){
                    Text("Click ‘+’ to add a new category")
                        .font(.headline)
                }
                else{
                    VStack {
                        ForEach(categories) { category in
                            CategoryCardView(category: category)
                                .background(category.theme.mainColor)
                        }
                    }
                }
            }
            .toolbar {
                if (categories.count < 10) {
                    Button(action: {isShowingEditSheet = true}){
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isShowingEditSheet) {
                CategoryAddEditView(categories: $categories, isShowingEditSheet: $isShowingEditSheet)
            }
        }
        
    }
}


struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView(categories: [])
    }
}
