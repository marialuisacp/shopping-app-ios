import Foundation

public class Configuration {
    private struct MainBundle {
        static var prefix: String = {
            guard let prefix = Bundle.main.object(forInfoDictionaryKey: "AAPLOfferingApplePayBundlePrefix") as? String else {
                return ""
            }
            return prefix
        }()
    }

    struct Merchant {
        static let identifier = "merchant.\(MainBundle.prefix).Offering-Apple-Pay-in-Your-App"
    }
}
