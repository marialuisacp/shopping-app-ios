public class Product: Hashable {
    public static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.id == rhs.id
        && lhs.title == rhs.title
        && lhs.price == rhs.price
        && lhs.categoty == rhs.categoty
        && lhs.imageUrl == rhs.imageUrl
        && lhs.description == rhs.description
    }
    
    var categoty: String
    var id: Int
    var imageUrl: String
    var price: Double
    var title: String
    var description: String

    public init(
        id: Int,
        categoty: String,
        imageUrl: String,
        price: Double,
        title: String,
        description: String
    ) {
        self.id = id
        self.title = title
        self.price = price
        self.categoty = categoty
        self.imageUrl = imageUrl
        self.description = description
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
        hasher.combine(price)
        hasher.combine(categoty)
        hasher.combine(imageUrl)
        hasher.combine(description)
    }
}
