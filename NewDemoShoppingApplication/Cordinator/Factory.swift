//
//  Factory.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 11.03.2023.
//



import UIKit

protocol ControllerFactory {
    func makeProfile() -> (viewModel: ProfilelViewModel, controller: ProfileViewController)

}

struct ControllerFactoryImpl: ControllerFactory {
    
    func makeProfile() -> (viewModel: ProfilelViewModel, controller: ProfileViewController) {
        let viewModel = ProfilelViewModel()
        let settingsController = ProfileViewController(profileViewModel: viewModel)
        return (viewModel, settingsController)
    }
}
