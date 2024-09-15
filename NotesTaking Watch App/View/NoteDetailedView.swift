//
//  NoteDetailedView.swift
//  NotesTaking Watch App
//
//  Created by Karim Soliman on 13/09/2024.
//

import SwiftUI


struct NoteDetailedView: View {

// MARK:- PROPERTIES
    let note: Note
    let count: Int
    let index: Int
    @State private var isCreditPresented = false
    @State private var isSettingsPresented = false



  // MARK:- BODY
    var body: some View {
        VStack(alignment: .center, spacing: 3) {

            Spacer()
            // BODY
            ScrollView(.vertical) {
                // HEADER

                HeaderView().padding(.top,40)
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            } //: SCROLLVIEW

            Spacer()

            // FOOTER
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                Image(systemName: "gear").imageScale(.large).onTapGesture {
                    isSettingsPresented.toggle()
                }.sheet(isPresented: $isSettingsPresented, content: {
                    SettingsView()
                })

                Spacer()
                Text("\(count) / \(index+1)")
                Spacer()
                Image(systemName: "info.circle").imageScale(.large).onTapGesture {
                    isCreditPresented.toggle()
                }.sheet(isPresented: $isCreditPresented, content: {
                    CreditsView()
                })

            } //: HSTACK
            .foregroundColor(.secondary)

        } //: VSTACK
        .padding(10)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    } //: BODY


 // MARK:- FUNCTIONS
}


// MARK:- PREVIEW
struct NoteDetailedView_Preview: PreviewProvider {

    static var sampleData: Note = Note(id: UUID(), text: "Herr Karim")

    static var previews: some View {
       // Group{
            NoteDetailedView(note: sampleData, count: 1, index: 2)

    }
}
