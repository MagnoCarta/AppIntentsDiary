//
//  SendNoteIntent.swift
//  AppIntentsWOOW
//
//  Created by Gilberto Magno on 11/04/25.
//

import AppIntents

struct SendNoteIntent: AppIntent {
    static var title: LocalizedStringResource = "Write a Note"
    static var description = IntentDescription("Sends a note to the Diary.")
    
    @Parameter(title: "Message")
    var message: String
    
    @Parameter(title: "Emoji")
    var emoji: Tag
    
    @MainActor
    func perform() async throws -> some IntentResult & ShowsSnippetView & ProvidesDialog {
        let view = GreetingView(message: message,
                                emoji: emoji)
        return .result(dialog: "👋", view: view)
    }
}

