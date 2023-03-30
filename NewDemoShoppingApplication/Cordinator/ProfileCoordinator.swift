//
//  LogInCoordinator.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 11.03.2023.
//

import UIKit

class ProfileCoordinator: Coordinator {
    
    var coordinators: [Coordinator] = []
    let navigation: UINavigationController
    let factory: ControllerFactory
    let coreDataStack: CoreDataStack

    private lazy var profile = {
        factory.makeProfile()
    }()
        
    init(navigation: UINavigationController,factory: ControllerFactory, coreDataStack: CoreDataStack) {
        self.navigation = navigation
        self.factory = factory
        self.coreDataStack = coreDataStack
    }
    
    func start() {
        navigation.pushViewController(profile.controller, animated: true)
        
        profile.viewModel.logOutt = {
            self.navigation.popToRootViewController(animated: true)
        }
        profile.viewModel.onShowNext = {
            print("hi")
        }
        profile.viewModel.coreDataStack = coreDataStack
        
    }
    
}






//class LogInCoordinator: Coordinator {
//
//    var coordinators: [Coordinator] = []
//    let navigation: UINavigationController
//    let factory: ControllerFactory
//    let signInDelegate: SignINDelegate
//    let coreDataStack: CoreDataStack
//
//    private lazy var profile = {
//        factory.makeProfile()
//    }()
//
//    init(navigation: UINavigationController,factory: ControllerFactory, coreDataStack: CoreDataStack) {
//        self.navigation = navigation
//        self.factory = factory
//        self.coreDataStack = coreDataStack
//        self.signInDelegate = SignInInspector(stack: self.coreDataStack)
//    }
//
//    func start() {
//        let logInVC = SignInViewController(delegate: signInDelegate)
//        logInVC.coordinator = self
//        navigation.pushViewController(logInVC, animated: true)
//    }
//
//    func goToProfile(user: UserModel?) {
//        profile.viewModel.logOutt = {
//            self.navigation.popToRootViewController(animated: true)
//        }
//        profile.viewModel.onShowNext = {
//            print("hi")
//        }
//
//        profile.viewModel.coreDataStack = coreDataStack
//        profile.viewModel.user = user
//        navigation.pushViewController(profile.controller, animated: true)
//        navigation.tabBarController?.tabBar.isHidden = false
//    }
//
//    func goToLogIN() {
//        let logInVC = LoginViewController(delegate: signInDelegate)
//        logInVC.coordinator = self
//        navigation.pushViewController(logInVC, animated: true)
//    }
//
//
//
//}
//
