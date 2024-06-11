import SwiftUI

struct CartView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \CartItem.timestamp, ascending: true)],
        animation: .default)
    private var cartItems: FetchedResults<CartItem>
    
    var body: some View {
        VStack(alignment: .center) {
            
            List {
                Text("My cart")
                    .foregroundStyle(Color("primary"))
                    .font(.headline)
                ForEach(Array(cartItems.enumerated()), id: \.element) { index, cartItem in
                    CartItemView(cartItem: cartItem)
                }
                .onDelete(perform: deleteItems)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map{ cartItems[$0] }.forEach(viewContext.delete)
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
