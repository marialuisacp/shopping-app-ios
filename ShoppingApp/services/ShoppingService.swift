import Foundation

class Shoppingservice {
    class func getProducts(completionHandler: (_ products: [NSObject]) -> Void) async {
        guard let url = URL(string: Config.PRODUCTS_STORE_URL) else {
            return
        }
        _ = URLRequest(url: url)
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [NSObject] {
                    completionHandler(json)
                }
            } catch let error {
                print(error)
            }
        } catch let error {
            print(error)
        }
    }
        
}
