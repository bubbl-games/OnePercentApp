//
//  SetupView.swift
//  OnePercent
//
//  Created by Andrew Beers on 1/7/23.
//

import SwiftUI

struct SetupView: View {
    @Binding var categories: [Category]
    @State private var newCategoryName = ""
    var body: some View {
        VStack {
            Text("Categories")
            List {
                ForEach(categories) { category in
                    HStack {
                        Text(category.name)
                        
                    }
                }
                .onDelete { indices in
                    categories.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Category", text: $newCategoryName)
                    Button(action: {
                        withAnimation {
                            let category = Category(name: newCategoryName)
                            categories.append(category)
                            newCategoryName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add category")
                    }
                    .disabled(newCategoryName.isEmpty)
                }
            }
        }
        
    }
}

struct SetupView_Previews: PreviewProvider {
    static var previews: some View {
        SetupView(categories: .constant(Category.firstSample))
    }
}
