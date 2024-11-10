import Foundation
import SwiftUI

struct ProductDetailView: View {
  @Environment(\.managedObjectContext) private var viewContext
  var product: Product
  var bgColor: Color = Utils.colorRGB(r: 168, g: 43, b: 129, opacity: 0.1)

  func addProductToCart(product: Product) {
    let newProduct = CartItem(context: viewContext)
    newProduct.id = Int64(product.id)
    newProduct.text = product.description
    newProduct.title = product.title
    newProduct.category = product.category
    newProduct.price = product.price
    newProduct.imageUrl = product.imageUrl
    newProduct.isPromotion = product.isPromotion
    newProduct.valuePromotion = Int64(product.valuePromotion)
    newProduct.timestamp = Date()

    do {
      try viewContext.save()
    } catch {
      let nsError = error as NSError
      fatalError("Unresolved error when try save product on cart:: \(nsError)")
    }
  }

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
        Text(product.category).font(.caption).foregroundStyle(Color("secondary"))
        Text(product.description).font(.caption)
        Spacer()
        Button {
          addProductToCart(product: product)
        } label: {
          Text("Add to cart").font(Font.body.weight(.bold)).foregroundStyle(Color.white)
            .frame(maxWidth: .infinity)
        }
        .frame(width: .infinity, height: 32)
        .background(RoundedRectangle(cornerRadius: 8).fill(Color("primary")))
      }
      .padding(.all, 24)
      .frame(width: .infinity)
      .background(
        LinearGradient(gradient: Gradient(colors: [bgColor, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
      )
      .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.03), radius: 5, x: 0, y: -10)
    }
    .navigationBarBackButtonHidden(true)
    .navigationBarItems(leading: CustomBackButton())
  }
}
