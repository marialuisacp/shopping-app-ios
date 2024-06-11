import SwiftUI

struct ProductDetailView: View {
    var product: Product
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: product.imageUrl)) { image in
                image.resizable().aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .frame(width: .infinity, height: 180)
            .background(Rectangle().fill(Color.white))
            VStack(alignment: .leading) {
                Text(product.title).foregroundStyle(Color("primary"))
                    .font(.title3)
                Text("$ " + String(format: "%.2f", product.price)).font(.headline)
                if product.isPromotion {
                    Text("-" + String(product.valuePromotion) + "%").foregroundStyle(Color.white).font(Font.caption2.weight(.bold))
                        .frame(width: 40, height: 18)
                        .background(Rectangle().fill(Color("secondary")))
                }
                Divider().background(Color.black).padding(.trailing, 128)
                Text(product.categoty).font(.caption).foregroundStyle(Color("secondary"))
                Text(product.description).font(.caption)
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 64)
        }
    }
}
