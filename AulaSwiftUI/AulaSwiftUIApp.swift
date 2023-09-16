//
//  AulaSwiftUIApp.swift
//  AulaSwiftUI
//
//  Created by Felipe C. Araujo on 16/09/23.
//

import SwiftUI

@main
struct AulaSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
