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
                              Image(category)
                                  .resizable()
                                  .aspectRatio(contentMode: .fill)
                                  .frame(width: 24, height: 24)
                            Text(category)
                                .font(.caption2.bold())
                                .foregroundStyle(Color.white)
                                .padding(.horizontal, 4)
                        }
                        .frame(width: 80, height: 80)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(
                                    LinearGradient(
                                        gradient: 
                                            Gradient(colors: [Color("primary"), Color("purple2")]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                        ))
                    }
                }
            }
        }
        .frame(width: .infinity, height: 84)
        .task {
            await Shoppingservice.getCategories {
                categories in
                categoriesArray = categories
                categoriesArray.append("all")
            }
        }
    }
}
