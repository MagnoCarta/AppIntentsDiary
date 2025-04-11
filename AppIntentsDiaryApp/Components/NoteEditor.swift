//
//  NoteEditor.swift
//  AppIntentsWOOW
//
//  Created by Gilberto Magno on 11/04/25.
//

import SwiftUI

struct NoteEditor: View {
    
    @Binding var text: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(.white.opacity(0.12))
            .overlay {
                ZStack(alignment: .topLeading) {
                    if text.isEmpty {
                        Text("Escreva sua nota...")
                            .foregroundStyle(Color(UIColor.secondaryLabel))
                    }
                    TextEditor(text: $text)
                        .textEditorStyle(.plain)
                        .background(.clear)
                }
                .padding()
            }
    }
}

#Preview {
    NoteEditor(text: .constant(""))
}
