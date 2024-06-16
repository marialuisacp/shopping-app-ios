import SwiftUI

struct ProductItem: View {
    var product: Product
    var productSelected: Binding<Product?>
    var cardWidth: CGFloat
    
    var body: some View {
        VStack(alignment: .center) {
            NavigationLink(
                destination: ProductDetailView(product: product),
                tag: product,
                selection: productSelected
            ) {
                ProductItemContent(product: product)
            }
        }
        .frame(width: cardWidth, height: 210)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(Color.white)
            .border(Color("gray_400"), width: 1)
            .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.02), radius: 5, x: 0, y: 0)
        )
    }
}
