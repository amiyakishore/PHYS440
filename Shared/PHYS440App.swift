//
//  PHYS440App.swift
//  Shared
//
//  Created by Amiya Kishore on 2/15/22.
//

import SwiftUI

@main
struct PHYS440App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
