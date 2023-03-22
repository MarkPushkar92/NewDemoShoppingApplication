//
//  NetworkFetcherService.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 16.03.2023.
//

import Foundation

class NetworkFetcherService {
    
    private let networkDataFetcher = DataFetcher()
    
    private func fetchSale(completion: @escaping (Sale?) -> Void) {
        let sale = "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac"
        networkDataFetcher.fetchData(urlString: sale, response: completion)
    }
    
    private func fetchLatest(completion: @escaping (LatestList?) -> Void) {
        
        let latest = "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
        networkDataFetcher.fetchData(urlString: latest, response: completion)
    }
    
    func fetchSearchWords(completion: @escaping (SearchWords?) -> Void) {
        
        let searchWords = "https://run.mocky.io/v3/4c9cd822-9479-4509-803d-63197e5a9e19"
        networkDataFetcher.fetchData(urlString: searchWords, response: completion)
    }
    
    func fetchDetails(completion: @escaping (ProductDetails?) -> Void) {
        
        let detailsURL = "https://run.mocky.io/v3/f7f99d04-4971-45d5-92e0-70333383c239"
        networkDataFetcher.fetchData(urlString: detailsURL, response: completion)
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
