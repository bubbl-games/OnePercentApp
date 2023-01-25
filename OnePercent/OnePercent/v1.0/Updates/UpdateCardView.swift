//
//  UpdateCardView.swift
//  OnePercent
//
//  Created by Andrew Beers on 1/24/23.
//

import SwiftUI

struct UpdateCardView: View {
    var category:Category
    var body: some View {
        HStack{
            Text(category.name)
                .foregroundColor(category.theme.mainColor)
            Spacer()
            Button(action: {}) {
                Image(systemName: "arrow.up.circle")
            }
            .foregroundColor(.white)
            .padding(8)
            .background(.green)
            .cornerRadius(10)
            Button(action: {}) {
                Image(systemName: "arrow.down.circle")
            }
            .foregroundColor(.white)
            .padding(8)
            .background(.red)
            .cornerRadius(10)
            Button(action: {}) {
                Image(systemName: "x.circle")
            }
            .foregroundColor(.white)
            .padding(8)
            .background(.black)
            .cornerRadius(10)
        }
        .padding(12)
        .frame(width: 330)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(category.theme.mainColor, lineWidth: 2)
        )
    }
}

struct UpdateCardView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateCardView(category: Category.firstSample[1])
    }
}
