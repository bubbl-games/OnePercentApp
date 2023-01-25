//
//  UpdatesView.swift
//  OnePercent
//
//  Created by Andrew Beers on 1/23/23.
//

import SwiftUI

struct UpdatesView: View {
    @Binding var categories: [Category]
    var body: some View {
        if (categories.count == 0){
            Text("Set up categories to start")
                .font(.headline)
        }
        else {
            VStack {
                ForEach($categories) { category in
                    UpdateCardView(category: category)
                }
            }
        }
    }
}

struct UpdatesView_Previews: PreviewProvider {
    static var previews: some View {
        UpdatesView(categories: .constant(Category.firstSample))
    }
}
