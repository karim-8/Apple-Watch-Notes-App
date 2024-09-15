//
//  CreditsView.swift
//  NotesTaking Watch App
//
//  Created by Karim Soliman on 13/09/2024.
//

import SwiftUI

struct CreditsView: View {

    // MARK:- PROPERTIES
    @State private var randomNumber: Int = Int.random(in: 1..<4)

    // Computed Property for getting random image everytime class will be called
    private var randomImage: String {
        return "developer-no\(randomNumber)"
    }

    // MARK:- FUNCTIONS

    // MARK:- BODY
    var body: some View {
        VStack(spacing: 3) {
            // PROFILE IMAGE
            Image(randomImage).resizable().scaledToFill().layoutPriority(1).frame(width: 50,height: 80)
            // HEADER
            HeaderView(headerTitle: "Credits")
            // CONTENT
            Text("Karim Soliman").foregroundColor(.primary).fontWeight(.bold)
            Text("Senior Developer").foregroundColor(.secondary).fontWeight(.bold)

        } //: VSTACK
        .padding(.top,20)
        .edgesIgnoringSafeArea(.all)

    } //: BODY
}


// MARK:- PREVIEW
struct CreditsView_Previews: PreviewProvider {
    
    static var previews: some View {
        CreditsView()
    }
}
