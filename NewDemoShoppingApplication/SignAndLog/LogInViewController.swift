//
//  ViewController.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 11.03.2023.
//


import UIKit

class LoginViewController: UIViewController {

//MARK: properties

    weak var coordinator: LogInCoordinator?

    private let logInView = LogInView()

    let coreDataStack: CoreDataStack

    var userArray = [UserModel]()

//MARK: init


    init(stack: CoreDataStack) {
        self.coreDataStack = stack
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


//MARK: life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        userArray = coreDataStack.fetchTasks()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.tabBarController?.tabBar.isHidden = true
    }

    @objc private func logInbuttonTapped() {
        self.coordinator?.goToProfile()
    }

}

//MARK: Layout

private extension LoginViewController {

    func setupViews() {
        view.backgroundColor = .white


        logInView.loginButton.addTarget(self, action: #selector(logInbuttonTapped), for: .touchUpInside)
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






