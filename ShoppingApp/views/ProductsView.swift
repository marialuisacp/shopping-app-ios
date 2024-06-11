import SwiftUI
import CoreData

struct ProductsView: View {
    @State var productsArray: [Product] = [Product]()
    @State var filterdProductsArray: [Product] = [Product]()
    @State var categoriesArray: [String] = [String]()
    @State var productSelected: Product? = nil
    
    var cardWidth = UIScreen.main.bounds.width / 2.2
    var columns: [GridItem] = [
        GridItem(.adaptive(minimum: 100, maximum: UIScreen.main.bounds.width / 2)),
        GridItem(.flexible(minimum: 100, maximum: UIScreen.main.bounds.width / 2), spacing: 0)
    ]
    
    func filterProducts(category: String) {
        filterdProductsArray = []
        if(category == "all") {
            filterdProductsArray = productsArray
        } else {
            let filteredProducts = productsArray.filter { product in
                if product.categoty == category {
                    return true
                } else {
                    return false
                }
            }
            filterdProductsArray = filteredProducts
        }
    }
    
    func goToCart() {
        print("Go to cart")
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ShoppingHeader()
            VStack(alignment: .leading) {
                CategoriesList(filterProducts: filterProducts, categoriesArray: categoriesArray)

                NavigationView {
                    ScrollView {
                        BannerPromotion()

                        LazyVGrid(columns: self.columns) {
                            ForEach(self.filterdProductsArray, id: \.self) { product in
                                VStack(alignment: .center) {
                                    NavigationLink(
                                        destination: ProductDetailView(product: product),
                                        tag: product,
                                        selection: $productSelected
                                    ) {
                                        ProductItem(product: product)
                                    }
                                }
                                .frame(width: cardWidth, height: 210)
                                .background(
                                    RoundedRectangle(
                                        cornerRadius: 8)
                                    .fill(Color.white)
                                    .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.02), radius: 5, x: 0, y: 0)
                                )
                                .border(Color("gray_300"), width: 1)
                            }
                        }
                        .task {
                            productsArray = []
                            filterdProductsArray = []
                            await Shoppingservice.getProducts {
                                products in
                                for product in products {
                                    let newProduct = Utils.buildNewProductFromObject(product: product);
                                    productsArray.append(newProduct)
                                    filterdProductsArray.append(newProduct)
                                }
                            }
                        }
                        .padding([.all, .trailing], 8)
                    }
                    .background(Color("gray_400"))
                    .frame(width: .infinity)
                }
            }
        }
    }
}
