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
        view.setImage(UIImage(systemName: "plus")?.withTintColor(.gray, renderingMode: .alwaysOriginal), for: .normal)
        view.backgroundColor = .lightGray
        view.layer.masksToBounds = true
        view.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        view.layer.cornerRadius = view.frame.width/2
        return view
    }()
    
    var nameLabel: UILabel = {
        var view = UILabel()
        view.textColor = .white
        view.font = UIFont.systemFont(ofSize: 10)
        view.text = ""
        view.sizeToFit()
        view.toAutoLayout()
        return view
    }()
    
    var priceLabel: UILabel = {
        var view = UILabel()
        view.textColor = .white
        view.font = UIFont.systemFont(ofSize: 16)
        view.textAlignment = .center
        view.text = ""
        view.toAutoLayout()
        return view
    }()
    
    var categoryLabel: UILabel = {
        var view = UILabel()
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.4)
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 12)
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
        contentView.addSubviews(image, button, nameLabel, priceLabel, categoryLabel)

        let constrains = [
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            image.topAnchor.constraint(equalTo: self.topAnchor),
            image.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            button.heightAnchor.constraint(equalToConstant: 25),
            button.widthAnchor.constraint(equalToConstant: 25),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            
            priceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            priceLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            nameLabel.bottomAnchor.constraint(equalTo: priceLabel.topAnchor, constant: -17),
            
            categoryLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            categoryLabel.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -16),
        
            categoryLabel.widthAnchor.constraint(equalToConstant: 80),
        ]
        NSLayoutConstraint.activate(constrains)
    }
}
