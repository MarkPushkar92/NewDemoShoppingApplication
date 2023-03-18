//
//  SelectCategoryView.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 16.03.2023.
//

import UIKit

class SelectCategoryView: UITableViewHeaderFooterView {
    
    //MARK: Properties
    
    private let searchTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "What are you looking for?"
        textfield.backgroundColor = .white
        textfield.textAlignment = .center
        textfield.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 0.5)
        textfield.clipsToBounds = false
        textfield.layer.cornerRadius = 15
        textfield.font = UIFont(name: "Montserrat-Regular", size: 12)
        textfield.toAutoLayout()
        return textfield
    }()
    
    private let textfiledSubViewIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "magnifyingglass")?.withRenderingMode(.alwaysOriginal)
        image.toAutoLayout()
        return image
    }()
       
    //MARK: CircleButtons
    private let phoneLabel = CustomLabel(labelName: .phones)
    private let headphonesLabel = CustomLabel(labelName: .headPhones)
    private let gameslabel = CustomLabel(labelName: .games)
    private let carsLabel = CustomLabel(labelName: .cars)
    private let furniturelabel = CustomLabel(labelName: .furniture)
    private let kidsLabel = CustomLabel(labelName: .kids)
    
    let phonesButton = CustomButton(buttonName: .phones)
    let headPhonesButton = CustomButton(buttonName: .headPhones)
    let gamesButton = CustomButton(buttonName: .games)
    let carsButton = CustomButton(buttonName: .cars)
    let furnitureButton = CustomButton(buttonName: .furniture)
    let kidsButton = CustomButton(buttonName: .kids)

        
    private let buttonStack: UIStackView = {
        let stack = UIStackView()
        stack.toAutoLayout()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 21
        return stack
    }()

    //MARK: Methods
    
    private func setupViews() {
        
        [phonesButton, headPhonesButton, gamesButton, carsButton, furnitureButton, kidsButton].forEach {
            buttonStack.addArrangedSubview($0)
        }
        
        searchTextField.addSubview(textfiledSubViewIcon)
        
        self.addSubviews(buttonStack, searchTextField, phoneLabel, headphonesLabel, gameslabel, carsLabel, furniturelabel, kidsLabel)
        let constrains = [
            
            searchTextField.widthAnchor.constraint(equalToConstant: 300),
            searchTextField.heightAnchor.constraint(equalToConstant: 34),
            searchTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            searchTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            
            buttonStack.heightAnchor.constraint(equalToConstant: 50),
            buttonStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            buttonStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            buttonStack.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 18),
            
            textfiledSubViewIcon.widthAnchor.constraint(equalToConstant: 16),
            textfiledSubViewIcon.heightAnchor.constraint(equalToConstant: 16),
            textfiledSubViewIcon.centerYAnchor.constraint(equalTo: searchTextField.centerYAnchor),
            textfiledSubViewIcon.leadingAnchor.constraint(equalTo: searchTextField.trailingAnchor, constant: -24),
            
            phoneLabel.centerXAnchor.constraint(equalTo: phonesButton.centerXAnchor),
            headphonesLabel.centerXAnchor.constraint(equalTo: headPhonesButton.centerXAnchor),
            gameslabel.centerXAnchor.constraint(equalTo: gamesButton.centerXAnchor),
            carsLabel.centerXAnchor.constraint(equalTo: carsButton.centerXAnchor),
            furniturelabel.centerXAnchor.constraint(equalTo: furnitureButton.centerXAnchor),
            kidsLabel.centerXAnchor.constraint(equalTo: kidsButton.centerXAnchor),

            phoneLabel.topAnchor.constraint(equalTo: buttonStack.bottomAnchor),
            headphonesLabel.topAnchor.constraint(equalTo: buttonStack.bottomAnchor),
            gameslabel.topAnchor.constraint(equalTo: buttonStack.bottomAnchor),
            carsLabel.topAnchor.constraint(equalTo: buttonStack.bottomAnchor),
            furniturelabel.topAnchor.constraint(equalTo: buttonStack.bottomAnchor),
            kidsLabel.topAnchor.constraint(equalTo: buttonStack.bottomAnchor),
            
        ]
        NSLayoutConstraint.activate(constrains)
    }
    
    //MARK: Init
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
        searchTextField.delegate = self
    }
     
    required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
    }
}

extension SelectCategoryView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}
