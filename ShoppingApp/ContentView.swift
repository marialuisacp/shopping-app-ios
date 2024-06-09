import SwiftUI
import CoreData

struct ContentView: View {
    @State var productsArray: [Product] = [Product]()
    
    var numbers = [0, 1, 2, 3]
    var body: some View {
        NavigationView {
            List(self.productsArray, id: \.self) { product in
                    NavigationLink {
                        VStack {
                                VStack(alignment: .leading) {
                                    Text(product.title)
                                        .font(.largeTitle)
                                    Divider().background(Color.black).padding(.trailing, 128)
                                    Text("Test")
                                        
                                    Divider().background(Color.black).padding(.trailing, 128)
                                }
                                .padding(.horizontal, 24)
                                .padding(.bottom, 64)
                        }
                    } label: {
                        
                        VStack(alignment: .leading) {
                            AsyncImage(url: URL(string: product.imageUrl)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 50, height: 50)
                            Text(product.title).font(.largeTitle)
                            Text(String(format: "%.2f", product.price))
                            Text(product.description)
                        }
                }
            }
            .listStyle(GroupedListStyle())
        }
        .task {
            await Shoppingservice.getProducts {
                products in 
                for product in products {
                    let newProduct = Product(id: product.value(forKey: "id") as! Int,
                                             categoty: product.value(forKey: "category") as! String,
                                             imageUrl:  product.value(forKey: "image") as! String,
                                             price: product.value(forKey: "price") as! Double,
                                             title: product.value(forKey: "title") as! String,
                                             description: product.value(forKey: "description") as! String)

                    productsArray.append(newProduct)
                }
            }
        }
    }
}
