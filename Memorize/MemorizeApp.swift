//
//  MemorizeApp.swift
//  Memorize
//
//  Created by João Víctor Benetti Filipim on 28/04/25.
//

import SwiftUI
import SwiftData

@main
struct MemorizeApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    // Instância do ViewModel
    var game = EmojiMemoryGame()

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game) // Passa o ViewModel como parâmetro
        }
        .modelContainer(sharedModelContainer)
    }
}
