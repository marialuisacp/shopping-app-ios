import React
import SwiftUI

@main
struct ShoppingApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    let persistenceController = CartService.shared
    
    
    var body: some Scene {
        WindowGroup {
            BottomTabView()
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
