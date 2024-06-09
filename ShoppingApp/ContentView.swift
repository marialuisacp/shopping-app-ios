import SwiftUI
import CoreData

struct ContentView: View {
    @State var productsArray: [Product] = [Product]()
    var cardWidth = UIScreen.main.bounds.width / 2.2;
    var columns: [GridItem] = [
        GridItem(.adaptive(minimum: 100, maximum: UIScreen.main.bounds.width / 2)),
        GridItem(.flexible(minimum: 100, maximum: UIScreen.main.bounds.width / 2), spacing: 0)
    ]
    
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
                    .frame(minWidth: 0, maxWidth: 200)
                Text("Your one-stop online shop for all your needs!")
                    .font(.caption)
                    .foregroundStyle(Color.white)
            }.padding()
            
            
            VStack(alignment: .leading) {
                NavigationView {
                    ScrollView {
                        LazyVGrid(columns: self.columns) {
                            ForEach(self.productsArray, id: \.self) { product in
                                VStack(alignment: .center) {
                                    VStack(alignment: .center) {
                                        AsyncImage(url: URL(string: product.imageUrl)) { image in
                                            image.resizable().aspectRatio(contentMode: .fit)
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .frame(width: 80, height: 80)
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
                                                Text(product.title)
                                                    .font(.body)
                                                    .foregroundStyle(Color("primary"))
                                                    .multilineTextAlignment(.leading)
                                                    .lineLimit(1)
                                                Text(product.categoty).font(.caption).foregroundStyle(Color("secondary"))
                                                Text("$ " + String(format: "%.2f", product.price)).foregroundStyle(Color.black)
                                                
                                                Divider().background(Color.black)
                                                
                                                Text(product.description)
                                                    .font(.caption2)
                                                    .foregroundStyle(Color.gray)
                                                    .multilineTextAlignment(.leading)
                                                    .lineLimit(2)
                                            }
                                            
                                        }
                                        .padding()
                                    }
                                }
                                .frame(width: cardWidth, height: 240)
                                .background(
                                    RoundedRectangle(
                                        cornerRadius: 8)
                                    .fill(Color.white)
                                    .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.02), radius: 5, x: 0, y: 0)
                                )
                                .border(Color("gray_100"), width: 1)
                                .padding()
                            }
                            
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
                        .padding([.horizontal, .trailing], 8)
                    }
                    .background(Color.white)
                    .frame(width: .infinity)
                }
            }
        }
    }
}
