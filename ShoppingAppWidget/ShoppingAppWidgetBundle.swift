import SwiftUI
import WidgetKit

@main
struct ShoppingAppWidgetBundle: WidgetBundle {
  var body: some Widget {
    ShoppingAppWidget()
    ShoppingAppWidgetLiveActivity()
  }
}
