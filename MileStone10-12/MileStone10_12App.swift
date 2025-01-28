//
//  MileStone10_12App.swift
//  MileStone10-12
//
//  Created by Anurag on 28/01/25.
//

import SwiftUI
import SwiftData
@main
struct MileStone10_12App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for:User.self)
    }
}
