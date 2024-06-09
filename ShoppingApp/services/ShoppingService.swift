import Foundation

class Shoppingservice {
    static func getShoppingData()  -> [NSObject]  {
        let url = URL(string: "https://fakestoreapi.com/products")!
        let session = URLSession.shared
        let request = URLRequest(url: url)
        var products: [NSObject] = [NSObject]()

        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            guard error == nil else {
                return
            }
            guard let data = data else {
                return
            }
            do {
                print(data)
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [NSObject] {
                   
                    products = json
                }
            } catch let error {
                print(error.localizedDescription)
            }
        })
        
         task.resume()
        print(products)
        return products
    }
}
