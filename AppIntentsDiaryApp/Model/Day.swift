//
//  Day.swift
//  AppIntentsWOOW
//
//  Created by Gilberto Magno on 10/04/25.
//

import SwiftData
import Foundation

@Model
class Day: Hashable {
    var notes: [Note]
    var date: String
    
    init(notes: [Note] = [],
         date: String = Day.today) {
        self.notes = notes
        self.date = date
    }
    
    static var today: String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: date)
    }

}
