//
//  HeaderView.swift
//  NotesTaking Watch App
//
//  Created by Karim Soliman on 13/09/2024.
//

import SwiftUI

struct HeaderView: View {


    // MARK:- PROPERTIES

    var headerTitle = ""

    // MARK:- BODY
    var body: some View {
        VStack {
            // If No data Do not show title
            !headerTitle.isEmpty ?
            Text(headerTitle.uppercased()).font(.title3).fontWeight(.bold)
                .foregroundColor(.accentColor)
            : nil

            HStack {
                Capsule().frame(height: 1)
                Image(systemName: "note.text")
                Capsule().frame(height: 1)
            } //: HSTACK
            .foregroundColor(.accentColor)
        } //: VSTACK
    }


    // MARK:- FUNCTIONS
}

// MARK:- PREVIEW
struct HeaderView_Preview: PreviewProvider {

    static var previews: some View {
        Group {
            HeaderView(headerTitle: "Credits")
            HeaderView(headerTitle: "")
        }
    }
}
