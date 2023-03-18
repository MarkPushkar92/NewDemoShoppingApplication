//
//  ProfileTableViewCell.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 13.03.2023.
//



import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    
    var image: UIImageView = {
        let imageView = UIImageView()
        imageView.toAutoLayout()
        return imageView
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.text = "hi"
        label.font = UIFont(name: "Montserrat-Medium", size: 14)
        return label
    }()
    
    var imageChevron: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .black
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.toAutoLayout()
        return imageView
    }()
    
    var balanceLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.text = "$ 1593"
        label.font = UIFont(name: "Montserrat-Medium", size: 18)
        label.isHidden = true
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpViews() {
        self.backgroundColor = UIColor(red: 0.98, green: 0.976, blue: 1, alpha: 1)

        self.addSubviews(image, imageChevron, titleLabel, balanceLabel)
        let constraints = [
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            image.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            image.heightAnchor.constraint(equalToConstant: 50),
            image.widthAnchor.constraint(equalToConstant: 50),
            
            imageChevron.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            imageChevron.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageChevron.heightAnchor.constraint(equalToConstant: 15),
            imageChevron.widthAnchor.constraint(equalToConstant: 15),
            
            titleLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            balanceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            balanceLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            balanceLabel.heightAnchor.constraint(equalToConstant: 25),

        ]
        NSLayoutConstraint.activate(constraints)
        
        
    }

}

