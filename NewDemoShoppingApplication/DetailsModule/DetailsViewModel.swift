//
//  DetailsViewModel.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 22.03.2023.
//
import UIKit

protocol DetailsOutput {
    
    var onTapShowNextModule: () -> Void { get }
}

final class DetailsViewModel: DetailsOutput {
    
    let networking = NetworkFetcherService()
        
    var coordinator: FeedCoordinator?
    
    // интерфейс для отправки данных в координатор
    var onShowNext: (() -> Void)?
    
    // интерфейс для приема данных от ViewController
    lazy var onTapShowNextModule: () -> Void = { [weak self] in
        self?.onShowNext?()
    }
    

}
