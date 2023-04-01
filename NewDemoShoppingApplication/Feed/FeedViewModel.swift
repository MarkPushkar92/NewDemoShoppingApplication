//
//  FeedViewModel.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 16.03.2023.
//



import UIKit

protocol FeedOutput {
    var moduleTitle: String { get }
    var onTapShowNextModule: () -> Void { get }
}

final class FeedViewModel: FeedOutput {
    
    var latestDeals = [Latest]()

    var flashSale = [FlashSale]()
    
    func getData(closure: @escaping () -> Void) {
        networking.getData {  latest, sale in
            if latest.isEmpty || sale.isEmpty {
                print("no data")
            } else {
                self.latestDeals = latest
                self.flashSale = sale
                closure()
            }
        }
    }

    var details: ProductDetails?
    
    let networking = NetworkFetcherService()
        
    var coordinator: FeedCoordinator?
    
    var moduleTitle: String {
        return "Trade by bata"
    }
    
    // интерфейс для отправки данных в координатор
    var onShowNext: ((ProductDetails?) -> Void)?

    // интерфейс для приема данных от ViewController
    lazy var onTapShowNextModule: () -> Void = { [weak self] in
        self?.networking.fetchDetails { details in
            self?.onShowNext?(details)
        }
    }
    


}
