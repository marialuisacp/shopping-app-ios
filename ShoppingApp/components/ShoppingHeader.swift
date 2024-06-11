import SwiftUI

struct ShoppingHeader: View {
    
    func goToCart() {
        print("Go to cart")
    }
    
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
                        Image("cart")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                    }
                    .frame(width: 40, height: 40)
                    .background(RoundedRectangle(cornerRadius: 8).fill(Color(.sRGBLinear, white: 1, opacity: 0.1)))
                }
            }
            Text("Your one-stop online shop for all your needs!")
                .font(.caption)
                .foregroundStyle(Color.white)
        }.padding()
    }
}
