//
//  ToolbarAddNote.swift
//  AppIntentsWOOW
//
//  Created by Gilberto Magno on 11/04/25.
//

import SwiftUI

extension View {
    func addNoteToolbarButton(coordinator: Coordinator) -> some View {
        self.toolbar(content: {
            ToolbarItem(placement: .primaryAction,
                        content: {
                Image(systemName: "plus")
                    .foregroundStyle(Color(UIColor.label))
                    .onTapGesture {
                        coordinator
                            .path
                            .append(
                                Note(
                                    text: "",
                                    date: Day.today)
                            )
                    }
                
            })
        })
    }
}
