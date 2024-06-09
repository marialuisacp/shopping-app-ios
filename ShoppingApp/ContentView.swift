import SwiftUI
import CoreData

struct ContentView: View {
    @State var productsArray: [Product] = [Product]()
    var body: some View {
        VStack(alignment: .leading) {
            Image("degrade")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 0)
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(minWidth: 0, maxWidth: 300, maxHeight: 100)
                Text("Sua loja online completa para todas as suas necessidades!")
                    .font(.caption)
                    .foregroundStyle(Color.white)
            }.padding()
            NavigationView {
                List(self.productsArray, id: \.self) { product in
                    VStack(alignment: .center) {
                        AsyncImage(url: URL(string: product.imageUrl)) { image in
                            image.resizable().aspectRatio(contentMode: .fit)
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: .infinity, height: 180)
                        .background(Rectangle().fill(Color.white))
                        
                        NavigationLink {
                            
                            VStack {
                                AsyncImage(url: URL(string: product.imageUrl)) { image in
                                    image.resizable().aspectRatio(contentMode: .fit)
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: .infinity, height: 180)
                                .background(Rectangle().fill(Color.white))
                                VStack(alignment: .leading) {
                                    Text(product.title).foregroundStyle(Color("primary"))
                                        .font(.title)
                                    Text("$ " + String(format: "%.2f", product.price)).font(.headline)
                                    Divider().background(Color.black).padding(.trailing, 128)
                                    Text(product.categoty).font(.caption).foregroundStyle(Color("secondary"))
                                    Text(product.description).font(.caption)
                                }
                                .padding(.horizontal, 24)
                                .padding(.bottom, 64)
                            }
                        } label: {
                            VStack(alignment: .leading) {
                                Text(product.title).font(.headline).foregroundStyle(Color("primary"))
                                Text(product.categoty).font(.caption).foregroundStyle(Color("secondary"))
                                Text("$ " + String(format: "%.2f", product.price))
                                Divider().background(Color.black).padding(.trailing, 128)
                                Text(product.description).font(.caption)
                            }
                            
                        }
                        .frame(width: .infinity, height: 160)
                        .padding()
                    }
                    
                }
                .listStyle(.plain)
                .background(Color.white)
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
}
