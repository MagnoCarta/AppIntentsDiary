//
//  Diary.swift
//  AppIntentsWOOW
//
//  Created by Gilberto Magno on 10/04/25.
//

import SwiftData
import SwiftUI

@MainActor
@Observable
class Diary {
    
    static var shared: Diary = .init()
    
    var days: [Day] = []
    
    init() {
        updateDay()
    }
    
    func updateDay() {
        let context = Database.shared.context
        var days: [Day] = try! context.fetch(.init())
        if !days.contains(where: { $0.date == Day.today }) {
            let newDay: Day = .init()
            days.append(newDay)
            context.insert(newDay)
        }
        self.days = days
    }
    
    func updateNote(_ note: Note) {
        if let dayIndex = days.firstIndex(where: {
            $0.date == note.date
        }) {
            if days[dayIndex].notes.contains(where: { $0.id == note.id }) {
                let noteIndex = days[dayIndex].notes.firstIndex(where: { $0.id == note.id })
                days[dayIndex].notes[noteIndex!] = note
            } else {
                days[dayIndex].notes.append(note)
            }
        }
    }
    
}
