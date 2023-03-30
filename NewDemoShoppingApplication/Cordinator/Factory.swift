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
    func makeDetails() -> (viewModel: DetailsViewModel, controller: DetailsViewController)
}

struct ControllerFactoryImpl: ControllerFactory {
    
    func makeDetails() -> (viewModel: DetailsViewModel, controller: DetailsViewController) {
        let viewModel = DetailsViewModel()
        let details = DetailsViewController(detailsViewModel: viewModel)
        return (viewModel, details)
    }
    
    func makeProfile() -> (viewModel: ProfilelViewModel, controller: ProfileViewController) {
        let viewModel = ProfilelViewModel()
        let profile = ProfileViewController(profileViewModel: viewModel)
        return (viewModel, profile)
    }
    
    func makeFeed() -> (viewModel: FeedViewModel, controller: FeedViewController) {
        let viewModel = FeedViewModel()
        let feed = FeedViewController(feedViewModel: viewModel)
        return (viewModel, feed)
    }
}
