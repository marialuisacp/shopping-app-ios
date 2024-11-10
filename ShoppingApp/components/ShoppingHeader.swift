import SwiftUI

struct ShoppingHeader: View {
  @Environment(\.managedObjectContext) private var viewContext
  @FetchRequest(
    sortDescriptors: [NSSortDescriptor(keyPath: \CartItem.timestamp, ascending: true)],
    animation: .default
  )
  private var cart: FetchedResults<CartItem>

  var body: some View {
    Image("degrade")
      .resizable()
      .aspectRatio(contentMode: .fill)
      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 0)
    VStack(alignment: .leading) {
      HStack {
        Image("logo")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(minWidth: 0, maxWidth: 200)
        Spacer()
        NavigationLink {
          CartView()
        } label: {
          CartIcon(count: String(cart.endIndex))
        }
      }
      Text("Your one-stop online shop for all your needs!")
        .font(.caption)
        .foregroundStyle(Color.white)
    }
    .padding(.top, 0)
    .padding(.horizontal, 24)
    .zIndex(1)
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 100)
  }
}
