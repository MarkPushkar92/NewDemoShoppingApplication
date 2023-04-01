//
//  SelectCategoryCell.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 01.04.2023.
//

import UIKit

class SelectCategoryCell: UICollectionViewCell {
    
//    var button = CustomButton(buttonName: .cars)
//
//    var label = CustomLabel(labelName: .cars)
    
    var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        let buttonSize: Double = 40
        button.frame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = buttonSize/2
        button.toAutoLayout()
        return button
    }()
    
    var label: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        label.textColor = .gray
        label.font = UIFont(name: "Montserrat-Regular", size: 8)
        label.textAlignment = .center
        label.toAutoLayout()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
       
        contentView.addSubviews(button, label)

        let constrains = [
           
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            label.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 5)

            
        ]
        NSLayoutConstraint.activate(constrains)
    }
}

