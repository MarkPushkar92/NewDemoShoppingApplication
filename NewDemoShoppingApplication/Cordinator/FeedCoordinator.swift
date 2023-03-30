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
    let signInDelegate: SignINDelegate
    let coreDataStack: CoreDataStack
    
    private lazy var feed = {
        factory.makeFeed()
    }()
    
    private lazy var details = {
        factory.makeDetails()
    }()
    
    init(navigation: UINavigationController,factory: ControllerFactory, coreDataStack: CoreDataStack) {
        self.navigation = navigation
        self.factory = factory
        self.coreDataStack = coreDataStack
        self.signInDelegate = SignInInspector(stack: self.coreDataStack)
    }
        
    func start() {
        let logInVC = SignInViewController(delegate: signInDelegate)
        logInVC.coordinator = self
        navigation.pushViewController(logInVC, animated: true)
    }
    
    func goToLogIN() {
        let logInVC = LoginViewController(delegate: signInDelegate)
        logInVC.coordinator = self
        navigation.pushViewController(logInVC, animated: true)
    }
    
    func goToFeed() {
        feed.viewModel.onShowNext = { prodDetails in
            self.goToDetails(details: prodDetails)
        }
        let feedVC = feed.controller
        feedVC.coordinator = self
        navigation.pushViewController(feedVC, animated: true)
        navigation.tabBarController?.tabBar.isHidden = false
        navigation.navigationBar.isHidden = false
    }
    
    private func goToDetails(details: ProductDetails?) {
        let detailsVC = self.details.controller
        detailsVC.productDetails = details
        detailsVC.coordinator = self
        self.navigation.pushViewController(detailsVC, animated: true)
    }
    
}


