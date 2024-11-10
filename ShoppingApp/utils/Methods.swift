import Foundation
import SwiftUI

enum Utils {
  public static func buildNewProductFromObject(product: NSObject) -> Product {
    let isPromotion = Bool.random()
    let valuePromotion = Int.random(in: 1 ..< 15)
    let newProduct = Product(
      id: product.value(forKey: "id") as! Int,
      categoty: product.value(forKey: "category") as! String,
      imageUrl: product.value(forKey: "image") as! String,
      price: product.value(forKey: "price") as! Double,
      title: product.value(forKey: "title") as! String,
      description: product.value(forKey: "description") as! String,
      isPromotion: isPromotion,
      valuePromotion: valuePromotion
    )
    return newProduct
  }

  public static func createEmptyProduct() -> Product {
    return Product(
      id: 0,
      categoty: "",
      imageUrl: "",
      price: 0,
      title: "",
      description: "",
      isPromotion: false,
      valuePromotion: 0
    )
  }

  public static func colorRGB(r: Double, g: Double, b: Double, opacity: Double) -> Color {
    return Color(.sRGBLinear, red: r / 255, green: g / 255, blue: b / 255, opacity: opacity)
  }
}
