//
//  CategoryEditView.swift
//  OnePercent
//
//  Created by Andrew Beers on 1/23/23.
//


import SwiftUI

struct CategoryEditView: View {
    @Binding var categories:[Category]
    @Binding var isShowingEditSheet:Bool
    @State var updatingCategory:Category
    var index:Int
    
    
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("Category Info")) {
                    TextField("Title", text: $updatingCategory.name)
                    ThemePicker(selection: $updatingCategory.theme)
                }
            }
            .toolbar{
                ToolbarItem(placement: .cancellationAction) {
                    Button("Dismiss"){
                        isShowingEditSheet = false
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save"){
                        categories[index].update(from: updatingCategory)
                        isShowingEditSheet = false
                    }
                }
            }
        }
    }
}

struct CategoryEditView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryEditView(categories:.constant(Category.firstSample), isShowingEditSheet: .constant(true), updatingCategory: Category.firstSample[0], index: 0)
    }
}
