//
//  ContentView.swift
//  NotesTaking Watch App
//
//  Created by Karim Soliman on 12/09/2024.
//

import SwiftUI

struct ContentView: View {

    // MARK:- PROPERTY
    @State private var notes: [Note] = [Note]()
    @State private var text: String = ""


    // MARK:- BODY
    var body: some View {
        NavigationView {
            VStack {

    }

  // MARK:- FUNCTIONS

    // Func to get the file document which will save the notes
    func getDocumentdirectory() -> URL {
        // As we are saving in file manager documents, we will get list of paths in URL shape
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }


    // Save notes inside the array into the file directory
    func saveNotes() {
        // Printing notes list array
        dump(notes, name: "Notes List", indent: 1, maxDepth: 3, maxItems: 100)

        // Encode data - create path - Write on file path
        do{
            let data = try? JSONEncoder().encode(notes)
            let url = getDocumentdirectory().appendingPathComponent("notes")
            try data?.write(to: url)
        } catch {
          print("Problem while saving --> saveNotes()")
        }
    }



    // func load to get the notes list from the file manager path
    func loadNotesFromFileManager() {
        // Fetch data from the path - decode it - update the current array list
        // Load functionality may take some seconds so we need to hold on the main thread
        // till we fetch them from Path.

        DispatchQueue.main.async {
            do {
                let url = getDocumentdirectory().appendingPathComponent("notes")
                let data = try Data(contentsOf: url)
                let decodedData = try JSONDecoder().decode([Note].self, from: data)
                notes = decodedData

            } catch {
                print("Problem while fetching data --> loadNotesFromFileManager()")
            }
        }
    }

    // Delete Note from the List
    func deleteNote(offsets: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offsets)
            saveNotes()
        }
    }
}

    // MARK:- PREVIEW
#Preview {
    ContentView()
}
