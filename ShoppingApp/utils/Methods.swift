import Foundation

struct Utils {
    public static func buildNewProductFromObject(product: NSObject) -> Product {
        let isPromotion = Bool.random()
        let valuePromotion = Int.random(in: 1..<15)
        let newProduct = Product(id: product.value(forKey: "id") as! Int,
                                 categoty: product.value(forKey: "category") as! String,
                                 imageUrl:  product.value(forKey: "image") as! String,
                                 price: product.value(forKey: "price") as! Double,
                                 title: product.value(forKey: "title") as! String,
                                 description: product.value(forKey: "description") as! String,
                                 isPromotion: isPromotion,
                                 valuePromotion: valuePromotion)
        return newProduct;
    }
}
