import SwiftUI

struct ShoppingHeader: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \CartItem.timestamp, ascending: true)],
        animation: .default)
    private var cart: FetchedResults<CartItem>
    
    var body: some View {
        Image("degrade")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 0)
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
                    VStack {
                        Text(String(cart.endIndex))
                            .font(.caption.bold())
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .background(
                                Circle()
                                    .fill(Color("purple"))
                                    .frame(width: 20, height: 20))
                            .padding(.bottom, -16)
                            .padding(.trailing, -16)
                            .zIndex(1)
                        VStack(alignment: .center) {
                            Image("cart")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                        }
                        .frame(width: 40, height: 40)
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color(.sRGBLinear, white: 1, opacity: 0.1)))
                    }
                }
            }
            Text("Your one-stop online shop for all your needs!")
                .font(.caption)
                .foregroundStyle(Color.white)
        }.padding()
    }
}
