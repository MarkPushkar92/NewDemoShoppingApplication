//
//  SignInViewController.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 19.03.2023.
//

import UIKit

class SignInViewController: UIViewController {

//MARK: properties

    weak var coordinator: LogInCoordinator?
    
    private let signInView = SignInView()
    
    private let delegate: SignINDelegate
    
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.tabBarController?.tabBar.isHidden = true
    }
    
    @objc private func signInbuttonTapped() {
        let email = signInView.email.text
        let name = signInView.firstName.text
        let lastName = signInView.lastName.text
        
        // 1: Check if mail is valid
        if delegate.checkIfEmailIsValid(email: email ) {
            guard let email = email else {return}
            // 2: Check if user alredy exists
            if delegate.checkIfUserExists(email: email) {
                showAlert(title: "User Already exists", actiontitle: "OK", message: "Plese proceed to Log in", closure: nil)
            } else {
                // 3: Check if name and last name are completed
                if delegate.checkIfNameisComplete(name: name, lastName: lastName) {
                    // 4: Set password for user
                    showAlert(title: "Set password", actiontitle: "Cancel", message: "") { alert in
                        alert.addTextField{ (textField) in
                            textField.placeholder = "Password"
                            textField.isSecureTextEntry = true
                        }
                        alert.addTextField{ (textField) in
                            textField.placeholder = "Retype password"
                            textField.isSecureTextEntry = true
                        }
                        let submitAction = UIAlertAction(title: "Submit", style: .default) {_ in
                            if alert.textFields![0].text == alert.textFields![1].text {
                                let password = alert.textFields![0].text
                                //5: Creating new User
                                guard let name = name else {return}
                                guard let lastName = lastName else {return}
                                guard let password = password else {return}
                                self.delegate.createAccount(name: name, lastName: lastName, email: email, password: password)
                                self.coordinator?.goToLogIN()
                            } else {
                                self.showAlert(title: "Password mismatch", actiontitle: "Try again", message: "try again", closure: nil)
                            }
                        }
                        alert.addAction(submitAction)
                    }
                } else {
                    showAlert(title: "Enter Yor name and last name", actiontitle: "OK", message: "", closure: nil)
                }
            }
        } else {
            showAlert(title: "Whoops", actiontitle: "OK", message: "Wrong email format, try again", closure: nil)
        }
    }
    
    @objc private func logInbuttonTapped() {
        self.coordinator?.goToLogIN()
    }
    
    private func showAlert(title: String, actiontitle: String, message: String, closure: ((UIAlertController)->())?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: actiontitle, style: .default)
        alert.addAction(okAction)
        if let closure = closure {
            closure(alert)
        }
        present(alert, animated: true, completion: nil)
    }
   
}

//MARK: Layout

private extension SignInViewController {
    
    func setupViews() {
        signInView.email.delegate = self
        signInView.firstName.delegate = self
        signInView.lastName.delegate = self
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


extension SignInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
