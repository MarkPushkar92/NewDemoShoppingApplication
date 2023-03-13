//
//  ProfilelViewModel.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 13.03.2023.
//

import UIKit

protocol ProfileOutput {
    var moduleTitle: String { get }
    var onTapShowNextModule: () -> Void { get }
}

final class ProfilelViewModel: ProfileOutput {
    
    var coordinator: LogInCoordinator?
    
    var moduleTitle: String {
        return "Profile"
    }
    
    // интерфейс для отправки данных в координатор
    var onShowNext: (() -> Void)?
    
    // интерфейс для приема данных от ViewController
    lazy var onTapShowNextModule: () -> Void = { [weak self] in
        self?.onShowNext?()
    }
    

}