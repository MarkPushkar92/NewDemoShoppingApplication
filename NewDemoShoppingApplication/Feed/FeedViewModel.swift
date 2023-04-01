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
        
    var latestModel = [LatestModel]()
    
    var saleModel = [SaleModel]()
    
    func getData(closure: @escaping () -> Void) {
        networking.getData {  latest, sale in
            if latest.isEmpty || sale.isEmpty {
                print("no data")
            } else {
                latest.forEach { item in
                    let latestItem = LatestModel(latest: item)
                    self.latestModel.append(latestItem)
                }
                sale.forEach { item in
                    let saleItem = SaleModel(sale: item)
                    self.saleModel.append(saleItem)
                }
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
