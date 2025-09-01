//
//  MyWidgetBundle.swift
//  MyWidget
//
//  Created by Gilberto Magno on 01/09/25.
//

import WidgetKit
import SwiftUI
import Intents

struct NotesEntry: TimelineEntry {
    let date: Date
    let note: String
    let relevance: TimelineEntryRelevance?
}

struct NotesProvider: TimelineProvider {
    func placeholder(in context: Context) -> NotesEntry {
        NotesEntry(date: Date(), note: "Sample note", relevance: TimelineEntryRelevance(score: 100))
    }

    func getSnapshot(in context: Context, completion: @escaping (NotesEntry) -> Void) {
        let entry = NotesEntry(date: Date(), note: "Sample note", relevance: TimelineEntryRelevance(score: 100))
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<NotesEntry>) -> Void) {
        let note = "Remember to write more notes"
        let entry = NotesEntry(date: Date(), note: note, relevance: TimelineEntryRelevance(score: 100))
        donateShortcut(for: note)
        completion(Timeline(entries: [entry], policy: .atEnd))
    }

    private func donateShortcut(for note: String) {
        let activity = NSUserActivity(activityType: "com.appintentsdiary.openNote")
        activity.title = "Open Note"
        activity.userInfo = ["text": note]

        let shortcut = INShortcut(userActivity: activity)
        let relevant = INRelevantShortcut(shortcut: shortcut)
        relevant.relevanceProviders = []
        INRelevantShortcutStore.default.setRelevantShortcuts([relevant]) { _ in }
       
        if let intent = relevant.shortcut.intent,
           let response = activity.interaction?.intentResponse {
            let interaction = INInteraction(intent: intent,
                                            response: response)
            interaction.donate(completion: nil)
        }
    }
}

struct NotesWidgetEntryView: View {
    var entry: NotesProvider.Entry

    var body: some View {
        Text(entry.note)
            .padding()
    }
}

struct NotesWidget: Widget {
    let kind: String = "NotesWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: NotesProvider()) { entry in
            NotesWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("Notes")
        .description("Shows the latest note")
        .supportedFamilies([.systemSmall])
    }
}


@main
struct MyWidgetBundle: WidgetBundle {
    var body: some Widget {
        MyWidget()
        MyWidgetControl()
        MyWidgetLiveActivity()
        NotesWidget()
    }
}
