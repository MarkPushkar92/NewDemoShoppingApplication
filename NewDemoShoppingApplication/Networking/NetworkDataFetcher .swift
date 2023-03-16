//
//  NetworkDataFetcher .swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 16.03.2023.
//

import Foundation


struct DataFetcher {
    
    private let networking = NetworkService()
        
    func fetchData<T: Decodable>(urlString: String, response: @escaping (T?) -> Void) {
        
        networking.request(urlString: urlString) { (data, error) in
            if let error = error {
                print("Error recieved requesting data: \(error.localizedDescription)")
                response(nil)
            }
            let decoded = self.decodeJSON(type: T.self, from: data)
            response(decoded)
        }
        
     
    }
    
    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else { return nil }
        do {
            let productList = try decoder.decode(type.self, from: data)
            return productList
        } catch let error as NSError {
            print(error.localizedDescription)
            print("parsing error")
        }
        return nil
    }
    
  
    
}
