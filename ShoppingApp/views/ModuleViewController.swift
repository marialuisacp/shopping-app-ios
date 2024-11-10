import Foundation
import React

class ModuleViewController: UIViewController {
  override func viewDidLoad() {
    if let bridge = BridgeManager.shared.bridge {
      view = RCTRootView(
        bridge: bridge,
        moduleName: "ShoppingAppModuleRN",
        initialProperties: [
          "type": "screen",
          "value": "offers",
        ]
      )
    }
  }
}
