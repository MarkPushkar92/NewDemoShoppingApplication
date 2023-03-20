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

    private let delegate: SignINDelegate
    
    private var users = [UserModel]()
    
//MARK: init
    
    init(delegate: SignINDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


//MARK: life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        users = delegate.coreDataStack.fetchTasks()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.tabBarController?.tabBar.isHidden = true
    }

    @objc private func logInbuttonTapped() {
        
        var userIsFound = false

        for user in users {
            if logInView.firstName.text == user.name && logInView.password.text == user.password  {
                userIsFound = true
                self.coordinator?.goToProfile()
            }
        }
        
        if userIsFound == false {
    
            let alert = UIAlertController(title: "Try again", message: "Wrong name, password or used doesn't exist", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            
        }
        
        
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






