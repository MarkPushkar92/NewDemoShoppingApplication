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

//        profile.viewModel.onShowNext = { [weak self] in
//            guard let controller = self?.configureNext() else { return }
//            self?.navigation.pushViewController(controller, animated: true)
//        }
//        
//        navigation.pushViewController(profile.controller, animated: true)
    }
    
    
//    private func configureNext() -> UIViewController {
//        return
//    }
    
}

