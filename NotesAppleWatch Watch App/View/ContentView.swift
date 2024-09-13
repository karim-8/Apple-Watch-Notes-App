//
//  ContentView.swift
//  NotesAppleWatch Watch App
//
//  Created by Karim Soliman on 11/09/2024.
//

import SwiftUI

struct ContentView: View {

    // MARK:- PROPERTY
    @State private var notes: [Note] = [Note]()
    @State private var text: String = ""


    // MARK:- FUNCTIONS

    // MARK:- BODY
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .center,spacing: 6) {
                    TextField("Add New Note", text: $text)

                    Button {
                    // ACTION
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 42, weight: .semibold))
                    }
                    .fixedSize()
                    .buttonStyle(PlainButtonStyle())
                    .foregroundColor(.accentColor)

                } //: HSTACK

                Spacer()

            } //: VSTACK
            .navigationTitle("Notes").font(.subheadline)
        }
    }
}

// MARK:- PREVIEW
#Preview {
    ContentView()
}
