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
