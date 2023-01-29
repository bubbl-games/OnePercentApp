//
//  FooterComponentView.swift
//  OnePercent
//
//  Created by Andrew Beers on 1/23/23.
//

import SwiftUI

struct FooterToolbar: ToolbarContent {
    let switchToCategories: () -> Void
    let switchToUpdates: () -> Void
    let switchToData: () -> Void
    
    var body: some ToolbarContent {
        ToolbarItemGroup(placement: .bottomBar) {
            Button(action: switchToCategories){
                VStack{
                    Image(systemName: "list.bullet")
                    Text("Categories")
                        .font(.system(size: 13))
                }
            }
            .frame(width: 50)
            .padding([.leading, .trailing], 20)
            Spacer()
            Button(action: switchToUpdates) {
                VStack{
                    Image(systemName: "arrow.triangle.2.circlepath.circle")
                    Text("Updates")
                        .font(.system(size: 13))
                }
            }
            .frame(width: 50)
            .padding([.leading, .trailing], 20)
            Spacer()
            Button(action: switchToData) {
                VStack{
                    Image(systemName: "chart.xyaxis.line")
                    Text("Data")
                        .font(.system(size: 13))
                }
            }
            .frame(width: 50)
                .padding([.leading, .trailing], 20)
        }
    }
}
