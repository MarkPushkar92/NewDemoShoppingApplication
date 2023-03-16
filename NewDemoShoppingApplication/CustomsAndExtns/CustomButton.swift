//
//  CustomButton.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 16.03.2023.
//

import UIKit

enum ButtonName: String {
    case phones
    case headPhones
    case games
    case cars
    case furniture
    case kids
}

class CustomButton: UIButton {
    
    static var buttonArray = [CustomButton]()
            
    private var image: UIImage?
    
    private var buttonName: ButtonName
    
    init(buttonName: ButtonName) {
        self.buttonName = buttonName
        super.init(frame: .zero)
        setupButtonImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButtonImage() {
        switch buttonName {
        case .phones:
            image = UIImage(named: "phones")
            setImage(image, for: .normal)
        case .headPhones:
            image = UIImage(named: "headPhones")
            setImage(image, for: .normal)
        case .games:
            image = UIImage(named: "games")
            setImage(image, for: .normal)
        case .cars:
            image = UIImage(named: "cars")
            setImage(image, for: .normal)
        case .furniture:
            image = UIImage(named: "furniture")
            setImage(image, for: .normal)
        case .kids:
            image = UIImage(named: "kids")
            setImage(image, for: .normal)
        }
        setupButton()

    }
    
    private func setupButton() {
    
        self.backgroundColor = .white
        let buttonSize: Double = 40

        self.frame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.width/2
        self.toAutoLayout()
    }
}




