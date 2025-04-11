//
//  TagMenu.swift
//  AppIntentsWOOW
//
//  Created by Gilberto Magno on 11/04/25.
//

import SwiftUI

struct TagMenu: View {
    
    @Binding var selectedTag: Tag
    
    var body: some View {
        Menu(selectedTag.emoji, content: {
            ForEach(Tag.allCases, id: \.self) { tag in
                Button(tag.emoji) {
                    selectedTag = tag
                }
            }
        })
    }
    
}

#Preview {
    TagMenu(selectedTag: .constant(.angry))
}
