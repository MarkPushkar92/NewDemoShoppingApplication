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
        textfield.toAutoLayout()
        return textfield
    }()
    
    private let textfiledSubViewIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "magnifyingglass")
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
    
    private let phonesButton = CustomButton(buttonName: .phones)
    private let headPhonesButton = CustomButton(buttonName: .headPhones)
    private let gamesButton = CustomButton(buttonName: .games)
    private let carsButton = CustomButton(buttonName: .cars)
    private let furnitureButton = CustomButton(buttonName: .furniture)
    private let kidsButton = CustomButton(buttonName: .kids)

        
    private let buttonStack: UIStackView = {
        let stack = UIStackView()
        stack.toAutoLayout()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 23
        return stack
    }()
    
    private let labelStack: UIStackView = {
        let stack = UIStackView()
        stack.toAutoLayout()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 23
        return stack
    }()

    //MARK: Methods
    
    private func setupViews() {
        
        [phonesButton, headPhonesButton, gamesButton, carsButton, furnitureButton, kidsButton].forEach {
            buttonStack.addArrangedSubview($0)
        }
        
        [phoneLabel, headphonesLabel, gameslabel, carsLabel, furniturelabel, kidsLabel].forEach {
            labelStack.addArrangedSubview($0)
        }
        
        searchTextField.addSubview(textfiledSubViewIcon)
        
        self.addSubviews(buttonStack, labelStack, searchTextField, furnitureButton)
        let constrains = [
            
            searchTextField.widthAnchor.constraint(equalToConstant: 300),
            searchTextField.heightAnchor.constraint(equalToConstant: 34),
            searchTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            searchTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            
            buttonStack.heightAnchor.constraint(equalToConstant: 100),
            buttonStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 27),
            buttonStack.trailingAnchor.constraint(equalTo: labelStack.trailingAnchor),
            buttonStack.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 18),
           
            labelStack.topAnchor.constraint(equalTo: buttonStack.bottomAnchor, constant: 7),
            labelStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 27),
            
            phonesButton.widthAnchor.constraint(equalToConstant: 71),
            phonesButton.heightAnchor.constraint(equalToConstant: 71),

            headPhonesButton.widthAnchor.constraint(equalToConstant: 71),
            headPhonesButton.heightAnchor.constraint(equalToConstant: 71),

            gamesButton.widthAnchor.constraint(equalToConstant: 71),
            gamesButton.heightAnchor.constraint(equalToConstant: 71),

            carsButton.widthAnchor.constraint(equalToConstant: 71),
            carsButton.heightAnchor.constraint(equalToConstant: 71),
            
            furnitureButton.widthAnchor.constraint(equalToConstant: 71),
            furnitureButton.heightAnchor.constraint(equalToConstant: 71),
            
            kidsButton.widthAnchor.constraint(equalToConstant: 71),
            kidsButton.heightAnchor.constraint(equalToConstant: 71),
            
            textfiledSubViewIcon.widthAnchor.constraint(equalToConstant: 16),
            textfiledSubViewIcon.heightAnchor.constraint(equalToConstant: 16),
            textfiledSubViewIcon.centerYAnchor.constraint(equalTo: searchTextField.centerYAnchor),
            textfiledSubViewIcon.leadingAnchor.constraint(equalTo: searchTextField.leadingAnchor, constant: 24),
            
            
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
