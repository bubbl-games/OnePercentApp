//
//  CategoriesView.swift
//  OnePercent
//
//  Created by Andrew Beers on 1/23/23.
//

import SwiftUI

struct CategoriesView: View {
    var categories: [Category]
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
                            /*@START_MENU_TOKEN@*/Text(category.name)/*@END_MENU_TOKEN@*/
                        }
                    }
                }
            }
            .toolbar {
                Button(action: {}){
                    Image(systemName: "plus")
                }
            }
        }
        
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView(categories: [])
    }
}
