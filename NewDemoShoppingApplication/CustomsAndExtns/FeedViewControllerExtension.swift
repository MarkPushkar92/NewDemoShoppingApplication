//
//  FeedViewControllerExtension.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 18.03.2023.
//

import UIKit

extension FeedViewController {
    
    func setupNavigation() {
        
        let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.image = UIImage(named: "defaultProfile")
            imageView.layer.cornerRadius = 30/2
            imageView.layer.masksToBounds = true
            imageView.toAutoLayout()
            return imageView
        }()
        
        let menuButton: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(named: "menu"), for: .normal)
            button.toAutoLayout()
            button.sizeToFit()
            return button
        }()
        
//        let barLabel: UILabel = {
//            let view = UILabel()
//            view.frame = CGRect(x: 0, y: 0, width: 89, height: 19)
//            view.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
//            view.font = UIFont(name: "Montserrat-Bold", size: 15)
//            view.textAlignment = .center
//            view.text = "Trade by bata"
//            view.toAutoLayout()
//            return view
//        }()
//
        let rightView: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
            view.toAutoLayout()
            return view
        }()


        let locationLabel: UILabel = {
            let view = UILabel()
            view.textColor = .gray
            view.font = UIFont(name: "Montserrat-Regular", size: 10)
            view.textAlignment = .center
            view.text = "Location"
            view.toAutoLayout()
            return view
        }()

        let imageChevronDown: UIImageView = {
            let imageView = UIImageView()
            imageView.tintColor = .black
            imageView.image = UIImage(systemName: "chevron.down")
            imageView.toAutoLayout()
            return imageView
        }()
        
        navigationController?.navigationBar.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        navigationController?.navigationBar.isHidden = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightView)
        rightView.addSubviews(imageView, locationLabel, imageChevronDown)
        let constrains = [

            rightView.widthAnchor.constraint(equalToConstant: 44),
            rightView.heightAnchor.constraint(equalToConstant: 44),

            imageView.widthAnchor.constraint(equalToConstant: 30),
            imageView.heightAnchor.constraint(equalToConstant: 30),
            imageView.centerXAnchor.constraint(equalTo: rightView.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: rightView.topAnchor),
            
            locationLabel.leadingAnchor.constraint(equalTo: rightView.leadingAnchor, constant: 2),
            locationLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 2),
            
            imageChevronDown.leadingAnchor.constraint(equalTo: locationLabel.trailingAnchor, constant: 0),
            imageChevronDown.centerYAnchor.constraint(equalTo: locationLabel.centerYAnchor),
            
            imageChevronDown.widthAnchor.constraint(equalToConstant: 5),
            imageChevronDown.heightAnchor.constraint(equalToConstant: 5),


        ]
        NSLayoutConstraint.activate(constrains)
    }
}
