import SwiftUI

struct CategoriesList: View {
    var filterProducts: (String) -> Void;
    @State var categoriesArray: [String] = [String]()
    var bgColor: Color = Utils.colorRGB(r: 178, g:48, b: 157, opacity: 1)

    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(self.categoriesArray, id: \.self) { category in
                    Button {
                        filterProducts(category)
                    } label: {
                        VStack {
                        VStack {
                            Image(category)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 26, height: 26)
                        }
                        .frame(width: 48, height: 48)
                        .background(
                            RoundedRectangle(cornerRadius: 24)
                              .fill(
                                  LinearGradient(
                                      gradient:
                                          Gradient(colors: [Color("purple"), Color("purple2")]),
                                      startPoint: .topLeading,
                                      endPoint: .bottomTrailing
                                  )
                              ))
                            Text(category)
                                .font(.caption2.bold())
                                .foregroundStyle(Color.black)
                                .padding(.horizontal, 4)
                                .multilineTextAlignment(.center)
                                .lineLimit(1)
                        }
                        .frame(width: 80, height: 80)
                    }
                }
            }
        }
        .frame(width: .infinity, height: 84)
        .padding(.top, 8)
        .scrollIndicators(.hidden)
        .task {
            await Shoppingservice.getCategories {
                categories in
                categoriesArray = categories
                categoriesArray.append("all")
            }
        }
    }
}
