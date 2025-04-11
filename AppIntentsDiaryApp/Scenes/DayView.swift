//
//  DayView.swift
//  AppIntentsWOOW
//
//  Created by Gilberto Magno on 11/04/25.
//

import SwiftUI

struct DaysView: View {
    
    var day: Day
    @State var coordinator: Coordinator = .shared
    
    var body: some View {
        VStack {
            if day.notes.isEmpty {
                Text("There is no Note in this day...")
                    .foregroundStyle(Color(UIColor.label))
            }
            VStack {
                ForEach(day.notes,
                        id: \.text) { note in
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.green.gradient.opacity(0.65))
                        .frame(width: 320,
                               height: 100)
                        .overlay(alignment: .topLeading) {
                            Text("\(note.text)")
                                .bold()
                                .padding()
                        }
                        .overlay(alignment: .topTrailing) {
                            Text(note.tag.emoji)
                                .padding(-12)
                                .font(.title)
                        }
                        .onTapGesture {
                            coordinator.path.append(note)
                        }
                }
                Spacer()
            }
        }
        .addNoteToolbarButton(coordinator: coordinator)
        .foregroundStyle(Color(UIColor.label))
        .navigationTitle("Day")
        .padding()
    }
}
