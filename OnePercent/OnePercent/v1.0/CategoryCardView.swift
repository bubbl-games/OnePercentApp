//
//  CategoryCardView.swift
//  OnePercent
//
//  Created by Andrew Beers on 1/23/23.
//

import SwiftUI

struct CategoryCardView: View {
    let category: Category
    
    
    var body: some View {
        HStack{
            Label("", systemImage: "text.justify")
                .padding()
            Spacer()
            VStack {
                Text("Name: " + category.name)
                Text("Color: " + category.theme.name)
            }
            Spacer()
            Label("", systemImage: "pencil")
                .padding()
        }
        .foregroundColor(category.theme.accentColor)
        .background(category.theme.mainColor)
       
    }
}

struct CategoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCardView(category: Category.firstSample[0])
            .background(Category.firstSample[0].theme.mainColor)
    }
}
