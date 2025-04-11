//
//  ContentView.swift
//  AppIntentsWOOW
//
//  Created by Gilberto Magno on 09/04/25.
//

import SwiftUI

struct ContentView: View {
    
    let diary: Diary = .init()
    
    @State var coordinator: Coordinator = .shared
    
    var body: some View {
        
        VStack {
            ForEach(diary.days, id: \.date) { day in
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.green.gradient.opacity(0.65))
                        .frame(width: 320,
                               height: 100)
                        .overlay(alignment: .topLeading) {
                            VStack(alignment: .leading) {
                                Text("Day \(day.date)")
                                Spacer()
                                HStack {
                                    Text("\(day.notes.count) Notes written this day")
                                }
                            }
                            .bold()
                            .padding()
                        }
                        .onTapGesture {
                            coordinator.path.append(day)
                        }
            }
            Spacer()
        }
        .navigationDestination(for: Day.self, destination: { day in
            DaysView(day: day)
        })
        .navigationDestination(for: Note.self,
                               destination: { note in
            NoteView(note: note)
        })
        .padding()
        .navigationTitle("Diary")
        .foregroundStyle(Color(UIColor.label))
    }
}

#Preview {
    ContentView()
}
