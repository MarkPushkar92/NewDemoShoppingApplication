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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.tabBarController?.tabBar.isHidden = true
    }
    
    @objc private func signInbuttonTapped() {
        self.coordinator?.goToProfile()
    }
   
}

//MARK: Layout

private extension LogInViewController {
    
    func setupViews() {
        view.backgroundColor = .white
        
        signInView.singInButton.addTarget(self, action: #selector(signInbuttonTapped), for: .touchUpInside)
        view.addSubview(signInView)
                let constraints = [
                    signInView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                    signInView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                    signInView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    signInView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                ]
                NSLayoutConstraint.activate(constraints)
        
//        view.addSubview(logInView)
//                let constraints = [
//                    logInView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//                    logInView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//                    logInView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//                    logInView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//                ]
//                NSLayoutConstraint.activate(constraints)
//
    }
    
}





