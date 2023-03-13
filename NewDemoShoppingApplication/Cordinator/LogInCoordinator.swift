//
//  LogInCoordinator.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 11.03.2023.
//

import UIKit

class LogInCoordinator: Coordinator {
    
    var coordinators: [Coordinator] = []
    let navigation: UINavigationController
    let factory: ControllerFactory
    private lazy var profile = {
        factory.makeProfile()
    }()
        
    init(navigation: UINavigationController,factory: ControllerFactory) {
        self.navigation = navigation
        self.factory = factory
    }
    
    func start() {
        let logInVC = LogInViewController()
        logInVC.coordinator = self
        navigation.pushViewController(logInVC, animated: true)
    }
    
    func goToProfile() {

        profile.viewModel.onShowNext = {
            print("hi")
        }
        
        navigation.pushViewController(profile.controller, animated: true)
        navigation.tabBarController?.tabBar.isHidden = false
    }
    
    
//    private func configureNext() -> UIViewController {
//        return
//    }
    
}

