//
//  ProfileHeaderView.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 13.03.2023.
//

import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {
    
    private let profileNameLabel: UILabel! = {
        let profileNameLabel = UILabel()
        profileNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        profileNameLabel.textColor = .label
        profileNameLabel.text = "Satria Adhi Pradana"
        profileNameLabel.toAutoLayout()
        return profileNameLabel
    }()
    
    private let changePhotoLabel: UILabel! = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .gray
        label.text = "Change photo"
        label.toAutoLayout()
        return label
    }()
    
    let imageView: UIImageView! = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "defaultProfile")
        imageView.layer.cornerRadius = 80/2
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.toAutoLayout()
        return imageView
    }()
    
    let uploadButton: UIButton = {
        let button = UIButton()
        button.toAutoLayout()
        button.backgroundColor = UIColor(red: 0.306, green: 0.333, blue: 0.843, alpha: 1)
        button.setTitle("Upload Item", for: .normal)
        button.layer.cornerRadius = 15
        return button
    }()
    
    private let uploadImage: UIImageView = {
        let image = UIImageView()
        image.toAutoLayout()
        image.tintColor = .white
        image.image = UIImage(systemName: "square.and.arrow.up")
        return image
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
 
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        
        contentView.addSubviews(imageView, changePhotoLabel, profileNameLabel, uploadButton)
        uploadButton.addSubview(uploadImage)
    
        let constraints = [
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            imageView.widthAnchor.constraint(equalToConstant: 80),
            imageView.heightAnchor.constraint(equalToConstant: 80),
            
            changePhotoLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            changePhotoLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),

            profileNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            profileNameLabel.topAnchor.constraint(equalTo: changePhotoLabel.bottomAnchor, constant: 20),
            
            uploadButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            uploadButton.topAnchor.constraint(equalTo: profileNameLabel.bottomAnchor, constant: 30),
            uploadButton.widthAnchor.constraint(equalToConstant: 290),
            uploadButton.heightAnchor.constraint(equalToConstant: 40),
            
            uploadImage.centerYAnchor.constraint(equalTo: uploadButton.centerYAnchor),
            uploadImage.leadingAnchor.constraint(equalTo: uploadButton.leadingAnchor, constant: 50),
            uploadImage.widthAnchor.constraint(equalToConstant: 20),
            uploadImage.heightAnchor.constraint(equalToConstant: 20),
            

                


           ]

        NSLayoutConstraint.activate(constraints)
        }
}


 
