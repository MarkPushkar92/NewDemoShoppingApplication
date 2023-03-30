//
//  MainCordinator.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 11.03.2023.
//


import UIKit

class MainCoordinator: Coordinator {
    
    var coordinators: [Coordinator] = []
    let tabBarController: TabBarViewController
    private let factory = ControllerFactoryImpl()
    lazy var coreDataStack = CoreDataStack()
    private var logOut: (() -> Void)?
    
    init() {
        tabBarController = TabBarViewController()
        let profile = configureProfile()
        let feed = configureFeed()
        let faves = configureFaves()
        let basket = configureBasket()
        let help = configureHelp()
        coordinators.append(profile)
        coordinators.append(feed)
        tabBarController.viewControllers = [feed.navigation, faves, basket, help, profile.navigation]
        profile.start()
        feed.start()
        logOut = {
            feed.navigation.popToRootViewController(animated: true)
            feed.navigation.navigationBar.isHidden = true
        }
    }
    
    

    private func configureProfile() -> ProfileCoordinator {
        let navigation = UINavigationController()
        let image = UIImage.init(systemName: "person")
        let selectedImage = UIImage(systemName: "person.circle")
        navigation.tabBarItem = UITabBarItem(title: "", image: image?.withTintColor(.darkGray), selectedImage: selectedImage?.withTintColor(.darkGray, renderingMode: .alwaysOriginal))
        let coordinator = ProfileCoordinator(navigation: navigation, factory: factory, coreDataStack: coreDataStack)
        tabBarController.tabBar.isHidden = true
        coordinator.logOutt = {
            print("yo")
            self.tabBarController.selectedIndex = 0
            self.logOut!()
            SignInInspector.currentUser = nil
        }
        
        return coordinator
    }

    private func configureFeed() -> FeedCoordinator {
        let navigation = UINavigationController()
        let image = UIImage.init(systemName: "house")
        let selectedImage = UIImage(systemName: "house.circle")
        navigation.tabBarItem = UITabBarItem(title: "", image: image?.withTintColor(.darkGray), selectedImage: selectedImage?.withTintColor(.darkGray, renderingMode: .alwaysOriginal))
        let coordinator = FeedCoordinator(navigation: navigation, factory: factory, coreDataStack: coreDataStack)
        return coordinator
    }

    private func configureFaves()  -> UINavigationController {
        let navigation = UINavigationController()
        let image = UIImage.init(systemName: "heart")
        let selectedImage = UIImage(systemName: "heart.circle")
        navigation.tabBarItem = UITabBarItem(title: "", image: image?.withTintColor(.darkGray), selectedImage: selectedImage?.withTintColor(.darkGray, renderingMode: .alwaysOriginal))
        return navigation
    }
    
    private func configureBasket()  -> UINavigationController {
        let navigation = UINavigationController()
        let image = UIImage.init(systemName: "cart")
        let selectedImage = UIImage(systemName: "cart.circle")
        navigation.tabBarItem = UITabBarItem(title: "", image: image?.withTintColor(.darkGray), selectedImage: selectedImage?.withTintColor(.darkGray, renderingMode: .alwaysOriginal))
        return navigation
    }
    
    private func configureHelp()  -> UINavigationController {
        let navigation = UINavigationController()
        let image = UIImage.init(systemName: "bubble.left")
        let selectedImage = UIImage(systemName: "bubble.left.circle")
        navigation.tabBarItem = UITabBarItem(title: "", image: image?.withTintColor(.darkGray), selectedImage: selectedImage?.withTintColor(.darkGray, renderingMode: .alwaysOriginal))
        return navigation
    }

}

