import Foundation
import React

class ModuleViewController: UIViewController {
    override func viewDidLoad() {
        if let bridge = BridgeManager.shared.bridge {
            self.view = RCTRootView(
                bridge: bridge,
                moduleName: "ShoppingAppModuleRN",
                initialProperties: nil
            )
        }
    }
}

