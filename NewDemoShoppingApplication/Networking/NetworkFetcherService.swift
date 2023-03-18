//
//  NetworkFetcherService.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 16.03.2023.
//

import Foundation

class NetworkFetcherService {
    
    private let networkDataFetcher = DataFetcher()
    
    func fetchSale(completion: @escaping (Sale?) -> Void) {
        let sale = "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac"
        networkDataFetcher.fetchData(urlString: sale, response: completion)
    }
    
    func fetchLatest(completion: @escaping (LatestList?) -> Void) {
        
        let latest = "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
        networkDataFetcher.fetchData(urlString: latest, response: completion)
    }
    
    
    func getData(completion: @escaping ([Latest], [FlashSale]) -> Void) {
        
        var latestDeals = [Latest]()
        var flashSale = [FlashSale]()

        fetchLatest { latest in
            guard let latest = latest else {return}
            latestDeals = latest.latest
            completion(latestDeals, flashSale)

        }
        fetchSale { sale in
            guard let sale = sale else {return}
            flashSale = sale.flashSale
            completion(latestDeals, flashSale)

        }
     
    }
    
}
