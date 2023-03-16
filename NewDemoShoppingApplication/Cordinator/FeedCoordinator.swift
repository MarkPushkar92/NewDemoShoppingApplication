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
        
    init(navigation: UINavigationController,factory: ControllerFactory) {
        self.navigation = navigation
        self.factory = factory
    }
    
    func start() {
        let feedVC = feed.controller
        feedVC.coordinator = self
        navigation.pushViewController(feedVC, animated: true)
    }
    
    func goToFeed() {

        feed.viewModel.onShowNext = {
            print("hi")
        }
        
   
    }
    
   

    
}

