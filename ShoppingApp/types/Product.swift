import Foundation

@objc public class Product: NSObject {
    var categoty: String
    var id: Int
    var imageUrl: String
    var price: String
    var title: String

    @objc public init(
        categoty: String,
        id: Int,
        imageUrl: String,
        price: String,
        title: String
    ) {
        self.id = id
        self.title = title
        self.price = price
        self.categoty = categoty
        self.imageUrl = imageUrl
    }
}
