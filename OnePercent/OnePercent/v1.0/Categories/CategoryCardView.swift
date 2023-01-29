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
                Image(systemName: "pencil")
                    .foregroundColor(category.theme.mainColor)
                    .padding(.trailing)
            }
            HStack {
                Text(category.name)
                Image(systemName: "circle.fill")
                    .foregroundColor(category.theme.mainColor)
            }
            .foregroundColor(category.theme.mainColor)
            Spacer()
        }
        .padding(12)
        .frame(width: 280)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(category.theme.mainColor, lineWidth: 2)
        )
    }
}

struct CategoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCardView(category: Category.firstSample[0], isShowingEditSheet: .constant(false), isEditing: .constant(false), indexToUpdate: .constant(0), index: 0)
    }
}
