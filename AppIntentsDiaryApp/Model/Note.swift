//
//  Note.swift
//  AppIntentsWOOW
//
//  Created by Gilberto Magno on 10/04/25.
//

import SwiftData
import Foundation
import AppIntents

struct Note: Codable, Hashable {
    var id: UUID = .init()
    var text: String
    var tag: Tag = .angry
    var date: String
}
