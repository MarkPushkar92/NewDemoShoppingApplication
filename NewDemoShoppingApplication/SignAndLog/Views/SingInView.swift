//
//  SingInView.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 13.03.2023.
//

import UIKit

class SignInView: UIView {
    
    private let singInLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign in"
        label.font = UIFont(name: "Montserrat-Medium", size: 26)
        label.toAutoLayout()
        return label
    }()
    
    private let googleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign in with Google"
        label.font = UIFont(name: "Montserrat-Medium", size: 16)
        label.toAutoLayout()
        return label
    }()
    
    private let appleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign in with Apple"
        label.font = UIFont(name: "Montserrat-Medium", size: 16)
        label.toAutoLayout()
        return label
    }()
    
    private let alreadyHaveLabel: UILabel = {
        let label = UILabel()
        label.text = "Already have an account?"
        label.textColor = .lightGray
        label.toAutoLayout()
        label.textAlignment = .left
        label.font = UIFont(name: "Montserrat-Medium", size: 10)

        return label
    }()
    
    let logInLabel: UIButton = {
        let label = UIButton()
        label.setTitle("Log In", for: .normal)
        label.toAutoLayout()
        label.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 12) ?? UIFont.systemFont(ofSize: 12)
        label.setTitleColor(.blue, for: .normal)
        return label
    }()

    let email: UITextField = {
        let txtfld = UITextField()
        txtfld.placeholder = "Email"
        txtfld.toAutoLayout()
        txtfld.backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1)
        txtfld.layer.borderColor = UIColor.lightGray.cgColor
        txtfld.layer.borderWidth = 0.5
        txtfld.layer.cornerRadius = 10
        txtfld.font = UIFont(name: "Montserrat-Regular", size: 16)
        txtfld.textAlignment = .center
        return txtfld
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

    let lastName: UITextField = {
        let txtfld = UITextField()
        txtfld.placeholder = "Last name"
        txtfld.toAutoLayout()
        txtfld.backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1)
        txtfld.layer.borderColor = UIColor.lightGray.cgColor
        txtfld.layer.borderWidth = 0.5
        txtfld.layer.cornerRadius = 10
        txtfld.font = UIFont(name: "Montserrat-Regular", size: 16)
        txtfld.textAlignment = .center
        return txtfld
    }()

    let singInButton: UIButton = {
        let button = UIButton()
        button.toAutoLayout()
        button.backgroundColor = UIColor(red: 0.306, green: 0.333, blue: 0.843, alpha: 1)
        button.setTitle("Sign in", for: .normal)
        button.titleLabel?.font = UIFont(name: "Montserrat-Bold", size: 18)
        button.layer.cornerRadius = 15
        return button
    }()
    
    private let appleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.toAutoLayout()
        imageView.image = UIImage(named: "apple")
        return imageView
    }()
    
    private let googleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.toAutoLayout()
        imageView.image = UIImage(named: "google")
        return imageView
    }()
    
    private func setupViews() {
        self.toAutoLayout()
        self.addSubviews(firstName, lastName, email, singInButton, singInLabel, alreadyHaveLabel, logInLabel, googleLabel, appleLabel, appleImage, googleImage)
        [firstName, lastName, email].forEach {
            $0.addDoneButton(title: "Done", target: self, selector:  #selector(tapDone(sender:)))
        }
        
        let constraints = [
           
            singInLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 55),
            singInLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            firstName.topAnchor.constraint(equalTo: singInLabel.bottomAnchor, constant: 77),
            firstName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 43),
            firstName.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -43),
            firstName.heightAnchor.constraint(equalToConstant: 29),

            lastName.topAnchor.constraint(equalTo: firstName.bottomAnchor, constant: 35),
            lastName.leadingAnchor.constraint(equalTo: firstName.leadingAnchor),
            lastName.trailingAnchor.constraint(equalTo: firstName.trailingAnchor),
            lastName.heightAnchor.constraint(equalToConstant: 29),

            email.topAnchor.constraint(equalTo: lastName.bottomAnchor, constant: 35),
            email.leadingAnchor.constraint(equalTo: firstName.leadingAnchor),
            email.trailingAnchor.constraint(equalTo: firstName.trailingAnchor),
            email.heightAnchor.constraint(equalToConstant: 29),

            singInButton.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 35),
            singInButton.leadingAnchor.constraint(equalTo: firstName.leadingAnchor),
            singInButton.trailingAnchor.constraint(equalTo: firstName.trailingAnchor),
            singInButton.heightAnchor.constraint(equalToConstant: 46),
            
            alreadyHaveLabel.topAnchor.constraint(equalTo: singInButton.bottomAnchor, constant: 17),
            alreadyHaveLabel.leadingAnchor.constraint(equalTo: singInButton.leadingAnchor),
            
            logInLabel.centerYAnchor.constraint(equalTo: alreadyHaveLabel.centerYAnchor),
            logInLabel.leadingAnchor.constraint(equalTo: alreadyHaveLabel.trailingAnchor, constant: 9),
            
            googleLabel.topAnchor.constraint(equalTo: singInButton.bottomAnchor, constant: 110),
            googleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 15),
            
            appleLabel.topAnchor.constraint(equalTo: googleLabel.bottomAnchor, constant: 45),
            appleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant:  15),
            
            appleImage.centerYAnchor.constraint(equalTo: appleLabel.centerYAnchor),
            appleImage.trailingAnchor.constraint(equalTo: appleLabel.leadingAnchor, constant: -10),
            appleImage.heightAnchor.constraint(equalToConstant: 23),
            appleImage.widthAnchor.constraint(equalToConstant: 23),
            
            googleImage.centerYAnchor.constraint(equalTo: googleLabel.centerYAnchor),
            googleImage.trailingAnchor.constraint(equalTo: googleLabel.leadingAnchor, constant: -10),
            googleImage.heightAnchor.constraint(equalToConstant: 23),
            googleImage.widthAnchor.constraint(equalToConstant: 23),
            

        ]
        NSLayoutConstraint.activate(constraints)
        
    
    }
    
    @objc private func tapDone(sender: Any) {
        self.endEditing(true)
    }
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
