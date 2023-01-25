//
//  CategoryAddEditView.swift
//  OnePercent
//
//  Created by Andrew Beers on 1/23/23.
//

import SwiftUI

struct CategoryAddView: View {
    @Binding var categories:[Category]
    @Binding var isShowingEditSheet:Bool
    @State var newCategory:Category = Category(name:"", theme:.red)
    
    
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("Category Info")) {
                    TextField("Title", text: $newCategory.name)
                    ThemePicker(selection: $newCategory.theme)
                }
            }
            .toolbar{
                ToolbarItem(placement: .cancellationAction) {
                    Button("Dismiss"){
                        isShowingEditSheet = false
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add"){
                        categories.append(newCategory)
                        isShowingEditSheet = false
                    }
                }
            }
        }
    }
}

struct CategoryAddView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryAddView(categories:.constant(Category.firstSample), isShowingEditSheet: .constant(true))
    }
}
