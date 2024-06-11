import SwiftUI

struct ProductItem: View {
    var product: Product

    var body: some View {
        VStack(alignment: .center) {
            if product.isPromotion {
                Text("-" + String(product.valuePromotion) + "%").foregroundStyle(Color.white).font(Font.caption2.weight(.bold))
                    .frame(width: 40, height: 12)
                    .background(Rectangle().fill(Color("secondary")))
            } else {
                Text("").foregroundStyle(Color.white).font(Font.caption2.weight(.bold))
                    .frame(width: 40, height: 12)
            }
            
            AsyncImage(url: URL(string: product.imageUrl)) { image in
                image.resizable().aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 80, height: 80)
            .background(Rectangle().fill(Color.white))
            
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text(product.title)
                        .font(.caption)
                        .foregroundStyle(Color("primary"))
                        .multilineTextAlignment(.leading)
                        .lineLimit(1)
                    Text(product.category).font(.caption).foregroundStyle(Color("secondary"))
                    Text("$ " + String(format: "%.2f", product.price)).foregroundStyle(Color.black)
                    
                    Divider().background(Color.black)
                    
                    Text(product.description)
                        .font(.caption2)
                        .foregroundStyle(Color.gray)
                        .multilineTextAlignment(.leading)
                        .lineLimit(3)
                }
                .padding([.horizontal, .trailing], 8)
            }
            .background(Color("gray_200"))
        }
    }
}
