//
//  LatestCollectionCell.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 17.03.2023.
//

import UIKit


class LatestCollectionCell: UICollectionViewCell {
    
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
        view.setImage(UIImage(systemName: "plus"), for: .normal)
        view.backgroundColor = .gray
        view.layer.masksToBounds = true
        view.layer.cornerRadius = view.frame.width/2
        return view
    }()
    
    var nameLabel: UILabel = {
        var view = UILabel()
        view.backgroundColor = .white
        view.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        view.font = UIFont.systemFont(ofSize: 10)
        view.text = ""
        view.sizeToFit()
        view.toAutoLayout()
        return view
    }()
    
    var priceLabel: UILabel = {
        var view = UILabel()
        view.backgroundColor = .white
        view.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        view.font = UIFont.systemFont(ofSize: 16)
        view.textAlignment = .center
        view.text = ""
        view.toAutoLayout()
        return view
    }()
    
    var categoryLabel: UILabel = {
        var view = UILabel()
        view.backgroundColor = .white
        view.textColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        view.font = UIFont.systemFont(ofSize: 10)
         view.textAlignment = .center
        view.text = ""
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
        contentView.addSubviews(image, button, nameLabel, priceLabel, categoryLabel)

        let constrains = [
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            image.topAnchor.constraint(equalTo: self.topAnchor),
            image.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            button.heightAnchor.constraint(equalToConstant: 25),
            button.widthAnchor.constraint(equalToConstant: 25),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.topAnchor.constraint(equalTo: priceLabel.topAnchor, constant: 17),
            
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            priceLabel.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            categoryLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            categoryLabel.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 16)
        ]
        NSLayoutConstraint.activate(constrains)
    }
}
