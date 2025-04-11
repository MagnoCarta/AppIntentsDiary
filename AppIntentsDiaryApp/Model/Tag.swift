//
//  Tag.swift
//  AppIntentsWOOW
//
//  Created by Gilberto Magno on 10/04/25.
//

import AppIntents

enum Tag: String, CaseIterable, Codable, AppEnum {
    static var typeDisplayRepresentation: TypeDisplayRepresentation  {
        .init(name: .init(stringLiteral: "Tag"))
    }
    static var caseDisplayRepresentations: [Tag : DisplayRepresentation] {
        [
            .happy: .init(title: "😊"),
            .sad: .init(title: "😢"),
            .angry: .init(title: "😡"),
            .neutral: .init(title: "😐"),
            .confused: .init(title: "😕"),
            .grateful: .init(title: "🙏"),
        ]
    }
    
    case happy, sad, angry, neutral, confused, grateful

    var emoji: String {
        Tag.caseDisplayRepresentations[self]?.title.key ?? ""
    }
    
}
