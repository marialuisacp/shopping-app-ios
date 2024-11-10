import SwiftUI

struct BottomTabView: View {
  @State private var selectedIndex: Int = 0

  var body: some View {
    TabView(selection: $selectedIndex) {
      NavigationStack {
        ProductsView()
      }
      .tabItem {
        Text("Home")
        Image(systemName: "house")
          .renderingMode(.template)
      }
      .tag(0)

      NavigationStack {
        ModuleViewControllerWrapper()
      }
      .tabItem {
        Text("Offers")
        Image(systemName: "gift")
          .renderingMode(.template)
      }
      .tag(1)

      NavigationStack {
        CartView(isFromBottomTab: true)
      }
      .tabItem {
        Text("Cart")
        Image(systemName: "cart")
          .renderingMode(.template)
      }
      .tag(2)
    }
  }
}
