//
//  ReusableCollectionCell.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 17.03.2023.
//

import UIKit


class ReusableCollectionCell: UICollectionViewCell {
    
 
    let heartButton: UIButton = {
        let view = UIButton()
        view.toAutoLayout()
        view.setImage(UIImage(systemName: "heart")?.withTintColor(.gray, renderingMode: .alwaysOriginal), for: .normal)
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.4)
        view.layer.masksToBounds = true
        view.frame = CGRect(x: 0, y: 0, width: 22, height: 22)
        view.isHidden = true
        view.layer.cornerRadius = view.frame.width/2
        return view
    }()
    
    let discountImg: UIImageView! = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "discountImg")
        imageView.layer.cornerRadius = 22/2
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.isHidden = true
        imageView.toAutoLayout()
        return imageView
    }()
    
    var discountLAbel: UILabel = {
        var view = UILabel()
        view.backgroundColor = .red
        view.textColor = .white
        view.font = UIFont(name: "Montserrat-Bold", size: 10)
        view.textAlignment = .center
        view.text = ""
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.isHidden = true
        view.toAutoLayout()
        return view
    }()
    
    
    var image: UIImageView = {
        let image = UIImageView()
        image.toAutoLayout()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()
    
    let button: UIButton = {
        let view = UIButton()
        view.toAutoLayout()
        view.setImage(UIImage(systemName: "plus")?.withTintColor(.gray, renderingMode: .alwaysOriginal), for: .normal)
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.4)
        view.layer.masksToBounds = true
        view.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        view.layer.cornerRadius = view.frame.width/2
        return view
    }()
    
    var nameLabel: UILabel = {
        var view = UILabel()
        view.textColor = .white
        view.font = UIFont(name: "Montserrat-Bold", size: 14)
        view.text = ""
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.toAutoLayout()
        return view
    }()
    
    var priceLabel: UILabel = {
        var view = UILabel()
        view.textColor = .white
        view.font = UIFont(name: "Montserrat-Medium", size: 12)
        view.textAlignment = .center
        view.text = ""
        view.toAutoLayout()
        return view
    }()
    
    var categoryLabel: UILabel = {
        var view = UILabel()
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.4)
        view.textColor = .black
        view.font = UIFont(name: "Montserrat-Regular", size: 12)
        view.textAlignment = .center
        view.text = ""
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        view.toAutoLayout()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .white
        layer.cornerRadius = 10
        contentView.addSubviews(image, button, nameLabel, priceLabel, categoryLabel, heartButton, discountImg, discountLAbel)

        let constrains = [
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            image.topAnchor.constraint(equalTo: self.topAnchor),
            image.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            button.heightAnchor.constraint(equalToConstant: 25),
            button.widthAnchor.constraint(equalToConstant: 25),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            
            priceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            priceLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            nameLabel.bottomAnchor.constraint(equalTo: priceLabel.topAnchor, constant: -16),
            nameLabel.widthAnchor.constraint(equalToConstant: 110),
            
            categoryLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            categoryLabel.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -16),
            categoryLabel.widthAnchor.constraint(equalToConstant: 80),
            
            heartButton.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            heartButton.heightAnchor.constraint(equalToConstant: 22),
            heartButton.widthAnchor.constraint(equalToConstant: 22),
            heartButton.trailingAnchor.constraint(equalTo: button.leadingAnchor, constant: -8),

            
            discountImg.topAnchor.constraint(equalTo: image.topAnchor, constant: 8),
            discountImg.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            discountImg.heightAnchor.constraint(equalToConstant: 22),
            discountImg.widthAnchor.constraint(equalToConstant: 22),
            
            discountLAbel.heightAnchor.constraint(equalToConstant: 22),
            discountLAbel.widthAnchor.constraint(equalToConstant: 60),
            discountLAbel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            discountLAbel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),

            
        ]
        NSLayoutConstraint.activate(constrains)
    }
}
