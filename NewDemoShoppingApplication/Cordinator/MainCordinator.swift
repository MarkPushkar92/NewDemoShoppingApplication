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
        coordinators.append(logIn)
        tabBarController.viewControllers = [ logIn.navigation]
        logIn.start()
    }
        
    private func configureProfile() -> LogInCoordinator {
        let navigation = UINavigationController()
        navigation.tabBarItem = UITabBarItem(title: "", image: UIImage.init(systemName: "house.fill"), tag: 0)
        let coordinator = LogInCoordinator(navigation: navigation, factory: factory)
        return coordinator
    }
    
   


}
