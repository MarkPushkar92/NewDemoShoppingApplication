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
    let factory = ControllerFactoryImpl()

    init() {
        tabBarController = TabBarViewController()
        let logIn = configureProfile()
        let feed = configureFeed()
        let faves = configureFaves()
        let basket = configureBasket()
        let help = configureHelp()
        coordinators.append(logIn)
        tabBarController.viewControllers = [logIn.navigation, feed, faves, basket, help]
        logIn.start()
    }

    private func configureProfile() -> LogInCoordinator {
        let navigation = UINavigationController()
        navigation.tabBarItem = UITabBarItem(title: "", image: UIImage.init(systemName: "house.fill"), tag: 0)
        let coordinator = LogInCoordinator(navigation: navigation, factory: factory)
        tabBarController.tabBar.isHidden = true
        return coordinator
    }

    private func configureFeed()  -> UINavigationController {
        let navigation = UINavigationController()
        navigation.tabBarItem = UITabBarItem(title: "", image: UIImage.init(systemName: "house.fill"), tag: 0)
        return navigation
    }

    private func configureFaves()  -> UINavigationController {
        let navigation = UINavigationController()
        navigation.tabBarItem = UITabBarItem(title: "", image: UIImage.init(systemName: "heart"), tag: 0)
        return navigation
    }
    
    private func configureBasket()  -> UINavigationController {
        let navigation = UINavigationController()
        navigation.tabBarItem = UITabBarItem(title: "", image: UIImage.init(systemName: "heart"), tag: 0)
        return navigation
    }
    
    private func configureHelp()  -> UINavigationController {
        let navigation = UINavigationController()
        navigation.tabBarItem = UITabBarItem(title: "", image: UIImage.init(systemName: "heart"), tag: 0)
        return navigation
    }

}
