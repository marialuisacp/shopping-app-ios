import Foundation

public class Configuration {
  private enum MainBundle {
    static var prefix: String = {
      guard let prefix = Bundle.main.object(forInfoDictionaryKey: "AAPLOfferingApplePayBundlePrefix") as? String else {
        return ""
      }
      return prefix
    }()
  }

  enum Merchant {
    static let identifier = "merchant.ml.shoppingApp"
  }
}
