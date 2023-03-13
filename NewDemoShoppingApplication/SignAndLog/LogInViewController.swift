//
//  ViewController.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 11.03.2023.
//

import UIKit

class LogInViewController: UIViewController {

//MARK: properties

    weak var coordinator: LogInCoordinator?
    
    private let signInView = SignInView()
    
    private let logInView = LogInView()

//MARK: life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

}

//MARK: Layout

private extension LogInViewController {
    
    func setupViews() {
        view.backgroundColor = .white
//        view.addSubview(signInView)
//                let constraints = [
//                    signInView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//                    signInView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//                    signInView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//                    signInView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//                ]
//                NSLayoutConstraint.activate(constraints)
        
        view.addSubview(logInView)
                let constraints = [
                    logInView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                    logInView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                    logInView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    logInView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                ]
                NSLayoutConstraint.activate(constraints)
        
    }
    
}





