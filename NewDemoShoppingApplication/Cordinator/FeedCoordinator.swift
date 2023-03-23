//
//  FeedCoordinator.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 16.03.2023.
//

import UIKit

class FeedCoordinator: Coordinator {
    
    var coordinators: [Coordinator] = []
    let navigation: UINavigationController
    let factory: ControllerFactory
    private lazy var feed = {
        factory.makeFeed()
    }()
    
    private lazy var details = {
        factory.makeDetails()
    }()
        
    init(navigation: UINavigationController,factory: ControllerFactory) {
        self.navigation = navigation
        self.factory = factory
    }
    
    
    func start() {
        feed.viewModel.onShowNext = { prodDetails in
            self.goToDetails(details: prodDetails)
        }
         
        let feedVC = feed.controller
        feedVC.coordinator = self
        navigation.pushViewController(feedVC, animated: true)
    }
    
    private func goToDetails(details: ProductDetails?) {
        let detailsVC = self.details.controller
        detailsVC.productDetails = details
        detailsVC.coordinator = self
        self.navigation.pushViewController(detailsVC, animated: true)

    }
   

    
}

