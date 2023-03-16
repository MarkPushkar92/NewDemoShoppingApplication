//
//  Factory.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 11.03.2023.
//



import UIKit

protocol ControllerFactory {
    func makeProfile() -> (viewModel: ProfilelViewModel, controller: ProfileViewController)
    func makeFeed() -> (viewModel: FeedViewModel, controller: FeedViewController)


}

struct ControllerFactoryImpl: ControllerFactory {
    
    func makeProfile() -> (viewModel: ProfilelViewModel, controller: ProfileViewController) {
        let viewModel = ProfilelViewModel()
        let prifile = ProfileViewController(profileViewModel: viewModel)
        return (viewModel, prifile)
    }
    
    func makeFeed() -> (viewModel: FeedViewModel, controller: FeedViewController) {
        let viewModel = FeedViewModel()
        let feed = FeedViewController(feedViewModel: viewModel)
        return (viewModel, feed)
    }
}
