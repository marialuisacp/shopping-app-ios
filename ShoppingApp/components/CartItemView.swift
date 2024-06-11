import SwiftUI

struct CartItemView: View {
    var cartItem: CartItem
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: cartItem.imageUrl ?? "")) { image in
                image.resizable().aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 40, height: 40)
            .background(Rectangle().fill(Color.white))
            
            VStack(alignment: .leading) {
                Text(cartItem.title ?? "")
                    .font(.caption.weight(.bold))
                    .foregroundStyle(Color("purple"))
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
                Text(cartItem.category ?? "").font(.caption2).foregroundStyle(Color("secondary"))
                Text("$ " + String(format: "%.2f", cartItem.price)).foregroundStyle(Color.black)
                
                Divider().background(Color.black)
                
                Text(cartItem.text ?? "")
                    .font(.caption2.italic())
                    .foregroundStyle(Color.gray)
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
            }
            .padding([.horizontal, .trailing], 8)
        }
    }
}
