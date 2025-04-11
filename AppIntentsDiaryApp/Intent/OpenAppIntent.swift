//
//  OpenAppIntent.swift
//  AppIntentsWOOW
//
//  Created by Gilberto Magno on 10/04/25.
//

import SwiftUI
import AppIntents

struct OpenAppIntent: AppIntent {
    static var title: LocalizedStringResource = "Open the App"

    static var description = IntentDescription("Launches the app and shows a welcome message.")

    static var openAppWhenRun: Bool = true

    @MainActor
    func perform() async throws -> some IntentResult & ProvidesDialog {
        return .result(dialog: "Welcome back to the app!")
    }
}
