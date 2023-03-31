//
//  RoundButtonLabel.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 16.03.2023.
//

import UIKit

class CustomLabel: UILabel {
    
    private var labelName: ButtonName
    
    private var labeltext: String?
    
    init(labelName: ButtonName) {
        self.labelName = labelName
        super.init(frame: .zero)
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabel() {
        switch labelName {
        case .phones:
            labeltext = "Phones"
        case .headPhones:
            labeltext = "Headphones"
        case .games:
            labeltext = "Games"
        case .cars:
            labeltext = "Cars"
        case .furniture:
            labeltext = "Furniture"
        case .kids:
            labeltext = "Kids"
        }
        
        self.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        self.textColor = .gray
        self.font = UIFont(name: "Montserrat-Regular", size: 8)
        self.textAlignment = .center
        self.text = labeltext
        self.toAutoLayout()
      
    }
}

