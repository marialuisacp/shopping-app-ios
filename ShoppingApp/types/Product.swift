public class Product: Hashable {
    public static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.id == rhs.id
        && lhs.title == rhs.title
        && lhs.price == rhs.price
        && lhs.category == rhs.category
        && lhs.imageUrl == rhs.imageUrl
        && lhs.description == rhs.description
        && lhs.isPromotion == rhs.isPromotion
        && lhs.valuePromotion == rhs.valuePromotion
    }
    
    var category: String
    var id: Int
    var imageUrl: String
    var price: Double
    var title: String
    var description: String
    var isPromotion: Bool
    var valuePromotion: Int

    public init(
        id: Int,
        categoty: String,
        imageUrl: String,
        price: Double,
        title: String,
        description: String,
        isPromotion: Bool,
        valuePromotion: Int
    ) {
        self.id = id
        self.title = title
        self.price = price
        self.category = categoty
        self.imageUrl = imageUrl
        self.description = description
        self.isPromotion = isPromotion
        self.valuePromotion = valuePromotion
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
        hasher.combine(price)
        hasher.combine(category)
        hasher.combine(imageUrl)
        hasher.combine(description)
        hasher.combine(isPromotion)
        hasher.combine(valuePromotion)
    }
}
