//
//  CategoriesView.swift
//  OnePercent
//
//  Created by Andrew Beers on 1/23/23.
//

import SwiftUI

struct CategoriesView: View {
    @Binding var categories: [Category]
    @State private var isShowingEditSheet = false
    @State private var isEditing = false
    @State private var indexToUpdate:Int = 0
    
    var body: some View {
        NavigationView{
            VStack {
                if (categories.count == 0){
                    Text("Click ‘+’ to add a new category")
                        .font(.headline)
                }
                else{
                    List {
                        ForEach(categories.indices, id: \.self) { index in
                            CategoryCardView(category: categories[index],
                                             isShowingEditSheet: $isShowingEditSheet,
                                             isEditing: $isEditing,
                                             indexToUpdate: $indexToUpdate,
                                             index: index)
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
                if (isEditing){
                    CategoryEditView(categories: $categories, isShowingEditSheet: $isShowingEditSheet, updatingCategory: categories[indexToUpdate], index: indexToUpdate)
                }
                else{
                    CategoryAddView(categories: $categories, isShowingEditSheet: $isShowingEditSheet)
                }
            }
            
        }
        
    }
    
    func move(from source: IndexSet, to destination: Int) {
         categories.move(fromOffsets: source, toOffset: destination)
     }
}




struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView(categories: .constant(Category.firstSample))
    }
}
