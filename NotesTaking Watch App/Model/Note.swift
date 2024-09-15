//
//  Note.swift
//  NotesTaking Watch App
//
//  Created by Karim Soliman on 12/09/2024.
//

import Foundation

// Identifiable:- Assure uniqness for the object
struct Note:  Codable {

    let id: UUID
    let text: String

}
