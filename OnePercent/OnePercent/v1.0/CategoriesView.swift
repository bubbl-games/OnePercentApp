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
                    List {
                        ForEach(categories) { category in
                            CategoryCardView(category: category)
                        }
                        .onMove(perform: move)
                    }
                    .environment(\.editMode, Binding.constant(EditMode.active))
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
    
    func move(from source: IndexSet, to destination: Int) {
         categories.move(fromOffsets: source, toOffset: destination)
     }
}




struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView(categories: [])
    }
}
