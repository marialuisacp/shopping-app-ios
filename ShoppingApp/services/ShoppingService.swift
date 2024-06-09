import Foundation

class Shoppingservice {
    class func getProducts(completionHandler: (_ products: [NSObject]) -> Void) async {
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            return
        }
        _ = URLRequest(url: url)
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            do {
                print("Shopping Service:: serialize")
                
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [NSObject] {
                    completionHandler(json)
                }
            } catch let error {
                print(error)
            }
        } catch {
            print("Failed to fetch site.")
        }
    }
        
}
