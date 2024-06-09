//
//  ShoppingAppApp.swift
//  ShoppingApp
//
//  Created by Maria Luísa Costa Pinto on 07/06/24.
//

import SwiftUI

@main
struct ShoppingAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
