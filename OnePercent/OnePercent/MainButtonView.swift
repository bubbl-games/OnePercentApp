//
//  MainButtonView.swift
//  OnePercent
//
//  Created by Andrew Beers on 1/7/23.
//

import SwiftUI

struct MainButtonView: View {
    let name: String
    let textColor: Color
    let backgroundColor: Color
    var body: some View {
        VStack {
            Text(name)
                .foregroundColor(textColor)
        }
        .padding()
        .background(backgroundColor)
    }
}

struct MainButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MainButtonView(name: "Example", textColor: .black, backgroundColor: .yellow)
    }
}
