import SwiftUI

@main
struct ShoppingAppApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
