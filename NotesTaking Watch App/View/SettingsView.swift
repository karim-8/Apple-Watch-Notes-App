//
//  SettingsView.swift
//  NotesTaking Watch App
//
//  Created by Karim Soliman on 13/09/2024.
//

import SwiftUI

struct SettingsView: View {
    
    //MARK:- PROPERTIES
    @AppStorage("lineCount") var lineCount: Int = 2
    @State private var value: Float = 1.0

    // MARK:- BODY
    var body: some View {
        VStack{

            // HEADER
            HeaderView(headerTitle: "Settings")
            // ACTUAL LINES
            Text("Lines: \(lineCount)".uppercased()).fontWeight(.bold)
            // SLIDER
            Slider(value: $value, in: 1...4, step: 1).accentColor(.accentColor)


        }//: VSTACK
    }

    // MARK:- FUNCTIONS
}


    // MARK:- PREVIEW
struct SettingsView_Previews: PreviewProvider {

    static var previews: some View {
        SettingsView()
    }
}
