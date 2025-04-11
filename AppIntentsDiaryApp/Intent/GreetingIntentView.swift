//
//  GreetingIntentView.swift
//  AppIntentsDiaryApp
//
//  Created by Gilberto Magno on 11/04/25.
//

import SwiftUI
import AppIntents

struct GreetingView: View {
    var message: String
    var emoji: Tag
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Note sent to the Diary!")
                .font(.title2)
            Button(intent: OpenAppIntent(), label: {
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color.accentColor)
                    .frame(height: 48)
                    .overlay {
                        Text("Open")
                    }
                    .foregroundStyle(.white)
            })
        }
        .foregroundStyle(Color(UIColor.label))
        .padding()
        .onAppear {
            Diary.shared.updateNote(.init(text: message,
                                          tag: emoji,
                                          date: Day.today))
        }
    }
}
