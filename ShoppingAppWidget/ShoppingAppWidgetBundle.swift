import WidgetKit
import SwiftUI

@main
struct ShoppingAppWidgetBundle: WidgetBundle {
    var body: some Widget {
        ShoppingAppWidget()
        ShoppingAppWidgetLiveActivity()
    }
}
