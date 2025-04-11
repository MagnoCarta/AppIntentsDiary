//
//  AppIntentsDiaryApp.swift
//  AppIntentsDiaryApp
//
//  Created by Gilberto Magno on 09/04/25.
//

import SwiftUI

@main
struct AppIntentsDiaryApp: App {
    
    @State var coordinator: Coordinator = .shared
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $coordinator.path) {
                ContentView()
                    .addNoteToolbarButton(coordinator: coordinator)
            }
        }
    }
}
