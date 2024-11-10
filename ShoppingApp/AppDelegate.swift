import React
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
  var window: UIWindow?

  func application(_: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
    BridgeManager.shared.loadReactNative(launchOptions: launchOptions)
    return true
  }
}
