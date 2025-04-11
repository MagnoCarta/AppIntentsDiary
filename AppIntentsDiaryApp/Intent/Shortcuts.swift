//
//  Shortcuts.swift
//  AppIntentsWOOW
//
//  Created by Gilberto Magno on 11/04/25.
//

import AppIntents

struct MyAppShortcuts: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] = [
            AppShortcut(
                intent: OpenAppIntent(),
                phrases: ["Launch \(.applicationName)"],
                shortTitle: "Open App",
                systemImageName: "app"
            ),
            AppShortcut(
                intent: SendNoteIntent(),
                phrases: ["Write \(.applicationName)",
                          "Write a Note"],
                shortTitle: "Write a Note",
                systemImageName: "pencil.and.scribble"
            )
        ]
}
