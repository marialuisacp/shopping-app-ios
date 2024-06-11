import SwiftUI

@main
struct ShoppingApp: App {
    let persistenceController = CartService.shared
    var body: some Scene {
        WindowGroup {
            ProductsView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
