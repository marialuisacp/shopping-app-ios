import SwiftUI

struct ProductDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var product: Product
    var buttonBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
            Image("backFeatured")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
        }
    }
    var bgColor: Color = Utils.colorRGB(r: 168, g:43, b: 129, opacity: 0.1)
    var body: some View {
        VStack {
            VStack(alignment: .center) {
                AsyncImage(url: URL(string: product.imageUrl)) { image in
                    image.resizable().aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: .infinity, height: 180)
                .background(Rectangle().fill(Color.white))
                .padding(.horizontal, 24)
                .padding(.vertical, 48)
            }
            VStack(alignment: .leading) {
                Text("$ " + String(format: "%.2f", product.price)).font(.title)
                Text(product.title).foregroundStyle(Color("primary"))
                    .font(.headline)
                if product.isPromotion {
                    Text("-" + String(product.valuePromotion) + "%").foregroundStyle(Color.white).font(Font.caption2.weight(.bold))
                        .frame(width: 40, height: 18)
                        .background(Rectangle().fill(Color("secondary")))
                }
                Divider().background(Color.black).padding(.trailing, 128)
                Text(product.categoty).font(.caption).foregroundStyle(Color("secondary"))
                Text(product.description).font(.caption)
                Spacer()
            }
            .padding(.all, 24)
            .frame(width: .infinity)
            .background(
                LinearGradient(gradient: Gradient(colors: [bgColor, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.03), radius: 5, x: 0, y: -10)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: buttonBack)
    }
}
