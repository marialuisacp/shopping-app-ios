import Foundation
import React

class ModuleViewController: UIViewController {
//    init(){
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder);
//        //fatalError("Always initialize ReactNativeScreen with init")
//    }

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

