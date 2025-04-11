//
//  Coordinator.swift
//  AppIntentsDiaryApp
//
//  Created by Gilberto Magno on 11/04/25.
//

import SwiftUI

@MainActor
@Observable
class Coordinator {
    var path: NavigationPath = .init()
    
    static let shared = Coordinator()
    
    private init() {}
}
