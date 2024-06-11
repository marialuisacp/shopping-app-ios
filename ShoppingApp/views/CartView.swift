import SwiftUI

struct CartView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \CartItem.timestamp, ascending: true)],
        animation: .default)
    private var cartItems: FetchedResults<CartItem>
    
    var body: some View {
        VStack {
            Text("Cart View")
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
    }
}
