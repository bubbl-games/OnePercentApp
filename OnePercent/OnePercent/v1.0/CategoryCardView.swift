//
//  CategoryCardView.swift
//  OnePercent
//
//  Created by Andrew Beers on 1/23/23.
//

import SwiftUI

struct CategoryCardView: View {
    let category: Category
    @Binding var isShowingEditSheet:Bool
    @Binding var isEditing:Bool
    @Binding var indexToUpdate:Int
    var index:Int
    
    var body: some View {
        HStack{
            Button(action: {
                isShowingEditSheet = true
                isEditing = true
                indexToUpdate = index
            }){
                Label("", systemImage: "pencil")
            }
            VStack {
                Text("Name: " + category.name)
                Text("Color: " + category.theme.name)
            }
            Spacer()
        }
        .padding(2)
        .foregroundColor(category.theme.accentColor)
        .background(category.theme.mainColor)
    }
}

struct CategoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCardView(category: Category.firstSample[0], isShowingEditSheet: .constant(false), isEditing: .constant(false), indexToUpdate: .constant(0), index: 0)
            .background(Category.firstSample[0].theme.mainColor)
    }
}
