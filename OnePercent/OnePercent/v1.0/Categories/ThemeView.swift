/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

struct ThemeView: View {
    let theme: Theme
    
    var body: some View {
        ZStack {
            HStack {
                Text(theme.name)
                    .padding(4)
            }
        }
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeView(theme: .red)
    }
}
