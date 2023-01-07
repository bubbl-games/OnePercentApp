//
//  HomePageView.swift
//  OnePercent
//
//  Created by Andrew Beers on 1/7/23.
//

import SwiftUI

struct HomePageView: View {
    var body: some View {
        VStack {
            Text("1% App")
            NavigationLink(destination: SetupView()){
                VStack {
                    Text("Setup")
                        .foregroundColor(.red)
                }
                .padding()
                .foregroundColor(.blue)
                .background(.yellow)
            }
            
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
