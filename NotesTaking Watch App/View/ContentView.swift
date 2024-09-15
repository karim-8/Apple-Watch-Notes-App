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
                HStack(alignment: .center, spacing: 6) {
                    TextField("Add New Note", text: $text)

                    Button {
                        // Create the note and append it to our array, "" make sure no previous text
                        guard text.isEmpty == false else {return}
                        let userNote = Note(id: UUID(), text: text)
                        notes.append(userNote)
                        text.removeAll()
                        saveNotes()


                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 30, weight: .semibold))
                    }
                    .fixedSize()
                    .buttonStyle(PlainButtonStyle())
                    .foregroundColor(.accentColor)

                } //: HSTACK
                Spacer()

                if notes.count >= 1 {
                    List {
                            //id: \.self means that each element in the range (i.e., each integer) is used as its own unique identifier.
                        ForEach(0..<notes.count, id:\.self) { index in
                        // Navigation Link
                            NavigationLink(
                                destination: NoteDetailedView(note: notes[index], count: notes.count, index: index)) {
                                HStack {
                                        // Simple yellow color on the lift
                                    Capsule().frame(width: 4)
                                        .foregroundColor(.accentColor)
                                    Text(notes[index].text)
                                        .lineLimit(1)
                                        .padding(.leading, 5)
                                }.frame(height: 20)
                            }
                        } //: LOOP
                        .onDelete(perform: deleteNote)

                    } //: LIST

                }else {
                    Spacer()
                    Image(systemName: "note.text")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                        .opacity(0.25)
                        .padding(25)
                    Spacer()
                }
            } //: VSTACK
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.bottom)
            .navigationTitle("Notes").font(.caption2)
            // Load notes from File manager everytime application being opened
            .onAppear(perform: {
                loadNotesFromFileManager()
            })
         }
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
