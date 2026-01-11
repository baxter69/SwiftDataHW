//
//  SwiftDataHWApp.swift
//  SwiftDataHW
//
//  Created by Владимир on 11.01.2026.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataHWApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            TestData.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Не удалось инициализировать SwiftData: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(sharedModelContainer)
        }
    }
}
