//
//  Tag.swift
//  AppIntentsWOOW
//
//  Created by Gilberto Magno on 10/04/25.
//

enum Tag: String, CaseIterable, Codable {
    case happy, sad, angry, neutral, confused, grateful
    
    var emoji: String {
        switch self {
        case .angry:
            return "😡"
        case .confused:
            return "😕"
        case .grateful:
            return "🙏"
        case .happy:
            return "😊"
        case .neutral:
            return "😐"
        case .sad:
            return "😢"
        }
    }
}
