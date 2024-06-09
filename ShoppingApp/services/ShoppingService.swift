import Foundation

class Shoppingservice {
    class func getProducts() {
        let url = URL(string: "https://fakestoreapi.com/products")!
        let session = URLSession.shared
        let request = URLRequest(url: url)
        var productsArray: [NSObject] = [NSObject]()

        print("Shopping Service:: get data")
        let task = try session.dataTask(
            with: request as URLRequest,
            completionHandler: { 
                data, response, error in
                    guard error == nil else {
                        return
                    }
                    guard let data = data else {
                        return
                    }
                do {
                    print("Shopping Service:: serialize")
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [NSObject] {
                        productsArray = json
                        print("Shopping Service:: save products")
                        print(productsArray)
                    }
                } catch let error {
                    print("Shopping Service:: error on get produtcs")
                    print(error.localizedDescription)
                }
        })
        
        task.resume()
        print(productsArray)
        print("Shopping Service:: complete request")
    }
}
