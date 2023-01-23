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
                }
            }
            Spacer()
            Button(action: switchToUpdates) {
                VStack{
                    Image(systemName: "arrow.triangle.2.circlepath.circle")
                    Text("Updates")
                }
            }
            Spacer()
            Button(action: switchToData) {
                VStack{
                    Image(systemName: "chart.xyaxis.line")
                    Text("Data")
                }
            }
        }
    }
}
