/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

struct ThemePicker: View {
    @Binding var selection: Theme
    
    var body: some View {
        HStack{
            Text("Color")
            Spacer()
            Image(systemName: "circle.fill")
                .foregroundColor(selection.mainColor)
            Spacer()
            Picker("", selection: $selection) {
                ForEach(Theme.allCases) { theme in
                    ThemeView(theme: theme)
                        .tag(theme)
                }
            }
        }
        
    }
}

struct ThemePicker_Previews: PreviewProvider {
    static var previews: some View {
        ThemePicker(selection: .constant(.red))
    }
}
