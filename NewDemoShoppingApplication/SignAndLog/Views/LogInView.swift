//
//  LogInView.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 13.03.2023.
//

import UIKit

class LogInView: UIView {
    
    private let welcomeBackLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome back"
        label.font = UIFont(name: "Montserrat-Medium", size: 26)
        label.toAutoLayout()
        return label
    }()

    let firstName: UITextField = {
        let txtfld = UITextField()
        txtfld.placeholder = "First name"
        txtfld.toAutoLayout()
        txtfld.backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1)
        txtfld.layer.borderColor = UIColor.lightGray.cgColor
        txtfld.layer.borderWidth = 0.5
        txtfld.layer.cornerRadius = 10
        txtfld.font = UIFont(name: "Montserrat-Regular", size: 16)
        txtfld.textAlignment = .center
        return txtfld
    }()

    let password: UITextField = {
        let txtfld = UITextField()
        txtfld.placeholder = "Password"
        txtfld.toAutoLayout()
        txtfld.backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1)
        txtfld.layer.borderColor = UIColor.lightGray.cgColor
        txtfld.layer.borderWidth = 0.5
        txtfld.layer.cornerRadius = 10
        txtfld.font = UIFont(name: "Montserrat-Regular", size: 16)
        txtfld.textAlignment = .center
        txtfld.isSecureTextEntry = true
        return txtfld
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.toAutoLayout()
        button.backgroundColor = UIColor(red: 0.306, green: 0.333, blue: 0.843, alpha: 1)
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont(name: "Montserrat-Bold", size: 18)
        button.layer.cornerRadius = 15
        return button
    }()
    
    
    private let isSecureButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "isSecure" ), for: .normal)
        button.toAutoLayout()
        return button
    }()
    
    private func setupViews() {
        self.toAutoLayout()
        self.addSubviews(firstName, welcomeBackLabel, password, loginButton, isSecureButton)

        isSecureButton.addTarget(self, action: #selector(isSecurePassword), for: .touchUpInside)
        
        let constraints = [
           
            welcomeBackLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 55),
            welcomeBackLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            firstName.topAnchor.constraint(equalTo: welcomeBackLabel.bottomAnchor, constant: 77),
            firstName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 43),
            firstName.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -43),
            firstName.heightAnchor.constraint(equalToConstant: 29),

            password.topAnchor.constraint(equalTo: firstName.bottomAnchor, constant: 35),
            password.leadingAnchor.constraint(equalTo: firstName.leadingAnchor),
            password.trailingAnchor.constraint(equalTo: firstName.trailingAnchor),
            password.heightAnchor.constraint(equalToConstant: 29),

           
            loginButton.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 35),
            loginButton.leadingAnchor.constraint(equalTo: firstName.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: firstName.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 46),
            
            isSecureButton.centerYAnchor.constraint(equalTo: password.centerYAnchor),
            isSecureButton.heightAnchor.constraint(equalTo: password.heightAnchor, constant: -5),
            isSecureButton.trailingAnchor.constraint(equalTo: password.trailingAnchor, constant: -5),
            

        ]
        NSLayoutConstraint.activate(constraints)
        
    
    }
    
    
    @objc private func isSecurePassword(sender: Any) {
        if password.isSecureTextEntry {
            password.isSecureTextEntry = false
        } else {
            password.isSecureTextEntry = true
        }
    }
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

