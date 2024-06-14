import SwiftUI

struct CartView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \CartItem.timestamp, ascending: true)],
        animation: .default)
    private var cartItems: FetchedResults<CartItem>
    var isFromBottomTab: Bool = false
    
    var body: some View {
        VStack(alignment: .center) {
            if isFromBottomTab {
                Image("logoColor")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(minWidth: 0, maxWidth: 180)
            }
            List {
                ForEach(Array(cartItems.enumerated()), id: \.element) { index, cartItem in
                    CartItemView(cartItem: cartItem)
                }
                .onDelete(perform: deleteItems)
                CartTotal(value: cartItems.reduce(0, { total, item in
                    total + item.price
                }))
            }
            .toolbar{
                if !isFromBottomTab {
                    EditButton()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: !isFromBottomTab ? CustomBackButton() : nil)
        .navigationTitle(!isFromBottomTab ? "My Cart" : "")
        .background(Color.white)
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
