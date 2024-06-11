import SwiftUI

struct CategoriesList: View {
    var filterProducts: (String) -> Void;
    @State var categoriesArray: [String] = [String]()

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
                              Text(category).font(.caption2).foregroundStyle(Color.white)
                        }
                        .frame(width: 80, height: 80)
                        .background(RoundedRectangle(cornerRadius: 2).fill(Color("purple")))
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
