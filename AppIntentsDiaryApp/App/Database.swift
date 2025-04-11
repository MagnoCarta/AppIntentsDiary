//
//  Database.swift
//  AppIntentsDiaryApp
//
//  Created by Gilberto Magno on 11/04/25.
//

import SwiftData
import SwiftUI

@MainActor
class Database {
    
    static var shared: Database = .init()
    
    let container = try! ModelContainer(
        for: Day.self,
        configurations: .init(url: .documentsDirectory.appending(path: "Diary"))
    )
    var context: ModelContext { container.mainContext }
}
