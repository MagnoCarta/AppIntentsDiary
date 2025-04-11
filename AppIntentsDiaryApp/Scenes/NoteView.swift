//
//  NoteView.swift
//  AppIntentsWOOW
//
//  Created by Gilberto Magno on 11/04/25.
//

import SwiftUI

struct NoteView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var note: Note
    
    init(note: Note = .init(text: "",
                            date: Day.today)) {
        self.note = note
    }
    
    var body: some View {
        VStack(alignment: .center) {
            NoteEditor(text: $note.text)
                .padding(.horizontal, 16)
            Spacer()
            Button("Save") {
                Diary.shared.updateNote(note)
                dismiss()
            }
        }
        .toolbar(content: {
            ToolbarItem(placement: .primaryAction, content: {
                TagMenu(selectedTag: $note.tag)
            })
        })
        .foregroundStyle(Color(UIColor.label))
        .padding(32)
    }
}
