//
//  ViewController.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 11.03.2023.
//

import UIKit

class SignInViewController: UIViewController {

//MARK: properties

    weak var coordinator: LogInCoordinator?
    
    private let signInView = SignInView()
    

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
    
    @objc private func logInbuttonTapped() {
        self.coordinator?.goToLogIN()
    }
   
}

//MARK: Layout

private extension SignInViewController {
    
    func setupViews() {
        view.backgroundColor = .white
        
        
        signInView.logInLabel.addTarget(self, action: #selector(logInbuttonTapped), for: .touchUpInside)
        signInView.singInButton.addTarget(self, action: #selector(signInbuttonTapped), for: .touchUpInside)
        view.addSubview(signInView)
                let constraints = [
                    signInView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                    signInView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                    signInView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    signInView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                ]
                NSLayoutConstraint.activate(constraints)

   }
    
}





