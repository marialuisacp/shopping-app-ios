import SwiftUI
import CoreData

struct ProductsView: View {
    @State var productsArray: [Product] = [Product]()
    @State var filterdProductsArray: [Product] = [Product]()
    @State var categoriesArray: [String] = [String]()
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
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(self.categoriesArray, id: \.self) { category in
                            Button {
                                  filterProducts(category: category)
                              } label: {
                                  VStack {
                                      Image(category)
                                          .resizable()
                                          .aspectRatio(contentMode: .fill)
                                          .frame(width: 24, height: 24)
                                      Text(category).font(.caption2).foregroundStyle(Color.white)
                                  }
                                  .frame(width: 80, height: 80)
                                  .background(RoundedRectangle(cornerRadius: 2).fill(Color("purple")))
                              }
                        }
                    }
                }
                .frame(width: .infinity, height: 84)
                
                NavigationView {
                    ScrollView {
                        Image("banner")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 460)
                            .padding([.all, .trailing], 12)
                            .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.05), radius: 5, x: 0, y: 0)

                        LazyVGrid(columns: self.columns) {
                            ForEach(self.filterdProductsArray, id: \.self) { product in
                                VStack(alignment: .center) {
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
                                                    .font(.title3)
                                                Text("$ " + String(format: "%.2f", product.price)).font(.headline)
                                                if product.isPromotion {
                                                    Text("-" + String(product.valuePromotion) + "%").foregroundStyle(Color.white).font(Font.caption2.weight(.bold))
                                                        .frame(width: 40, height: 18)
                                                        .background(Rectangle().fill(Color("secondary")))
                                                }
                                                Divider().background(Color.black).padding(.trailing, 128)
                                                Text(product.categoty).font(.caption).foregroundStyle(Color("secondary"))
                                                Text(product.description).font(.caption)
                                            }
                                            .padding(.horizontal, 24)
                                            .padding(.bottom, 64)
                                        }
                                    } label: {
                                        VStack(alignment: .center) {
                                            if product.isPromotion {
                                                Text("-" + String(product.valuePromotion) + "%").foregroundStyle(Color.white).font(Font.caption2.weight(.bold))
                                                    .frame(width: 40, height: 12)
                                                    .background(Rectangle().fill(Color("secondary")))
                                                    .position(x: 20, y: 10)
                                            } else {
                                                Text("").foregroundStyle(Color.white)
                                                    .frame(width: 40, height: 12)
                                                    .position(x: 20, y: 10)
                                            }
                                            
                                            AsyncImage(url: URL(string: product.imageUrl)) { image in
                                                image.resizable().aspectRatio(contentMode: .fit)
                                            } placeholder: {
                                                ProgressView()
                                            }
                                            .frame(width: 80, height: 80)
                                            .background(Rectangle().fill(Color.white))
                                            
                                            VStack(alignment: .leading) {
                                                VStack(alignment: .leading) {
                                                    Text(product.title)
                                                        .font(.caption)
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
                                                .padding([.horizontal, .trailing], 8)
                                            }
                                            .background(Color("gray_200"))
                                        }
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
                                    productsArray.append(newProduct)
                                    filterdProductsArray.append(newProduct)
                                }
                            }
                            await Shoppingservice.getCategories {
                                categories in
                                categoriesArray = categories
                                categoriesArray.append("all")
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
