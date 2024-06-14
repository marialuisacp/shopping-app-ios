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
                ForEach(Array(cartItems.enumerated()), id: \.element) { index, cartItem in
                    CartItemView(cartItem: cartItem)
                }
                .onDelete(perform: deleteItems)
                CartTotal(value: cartItems.reduce(0, { total, item in
                    total + item.price
                }))
            }
            .toolbar {
                EditButton()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
        .navigationTitle("My Cart")
        .background(Color("gray_100"))
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
