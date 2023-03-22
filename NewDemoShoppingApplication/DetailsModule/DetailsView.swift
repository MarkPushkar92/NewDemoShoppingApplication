//
//  DetailsView.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 22.03.2023.
//

import UIKit

class DetailsView: UIView {
    
    //MARK: UI Properties
        
    var productDetails: ProductDetails?
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.toAutoLayout()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 30
        image.clipsToBounds = true
        return image
    }()
    
    private let nameLabel: UILabel = {
        var view = UILabel()
        view.font = UIFont(name: "Montserrat-Bold", size: 18)
        view.text = ""
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.toAutoLayout()
        return view
    }()
    
    private let priceLabel: UILabel = {
        var view = UILabel()
        view.font = UIFont(name: "Montserrat-Medium", size: 18)
        view.text = ""
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.toAutoLayout()
        return view
    }()
    
    private let descrLabel: UILabel = {
        var view = UILabel()
        view.font = UIFont(name: "Montserrat-regular", size: 12)
        view.textColor = .lightGray
        view.text = ""
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.toAutoLayout()
        return view
    }()
    
    private let starImg: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "star")
        imageView.toAutoLayout()
        return imageView
    }()
    
    private let ratingLabel: UILabel = {
        var view = UILabel()
        view.font = UIFont(name: "Montserrat-Bold", size: 12)
        view.text = ""
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.toAutoLayout()
        return view
    }()
    
    private let reviewsLabel: UILabel = {
        var view = UILabel()
        view.font = UIFont(name: "Montserrat-Regular", size: 12)
        view.text = ""
        view.textColor = .lightGray
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.toAutoLayout()
        return view
    }()
    
    private let colorLabel: UILabel = {
        var view = UILabel()
        view.font = UIFont(name: "Montserrat-Regular", size: 14)
        view.text = "Color:"
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.toAutoLayout()
        return view
    }()
    
    private let colorStack: UIStackView = {
        let stack = UIStackView()
        stack.toAutoLayout()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 21
        return stack
    }()
    
    private let bottomView: UIView = {
        let view = UIView()
        view.toAutoLayout()
        view.backgroundColor = UIColor(red: 0.094, green: 0.09, blue: 0.149, alpha: 1)
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 30
        return view
    }()
    
    private let quantityLabel: UILabel = {
        var view = UILabel()
        view.font = UIFont(name: "Montserrat-Regular", size: 12)
        view.text = "Quantity:"
        view.textColor = .lightGray
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.toAutoLayout()
        return view
    }()
    
    private let addtoCartLabel: UILabel = {
        var view = UILabel()
        view.textColor = UIColor.white
        view.font = UIFont(name: "Montserrat-Bold", size: 10)
        view.textAlignment = .left
        view.text = "ADD TO CART"
        view.toAutoLayout()
        return view
    }()

    let totalPriceLabel: UILabel = {
        var view = UILabel()
        view.font = UIFont(name: "Montserrat-Medium", size: 12)
        view.text = ""
        view.textColor = .lightGray
        view.toAutoLayout()
        return view
    }()
    
    private let addtoCartView: UIView = {
        let view = UIView()
        view.toAutoLayout()
        view.backgroundColor = UIColor(red: 0.306, green: 0.333, blue: 0.843, alpha: 1)
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 14
        return view
    }()
    
    let plusButton: UIButton = {
        let button = UIButton()
        button.imageView?.tintColor = .white
        button.backgroundColor = UIColor(red: 0.306, green: 0.333, blue: 0.843, alpha: 1)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 5
        button.toAutoLayout()
        return button
    }()
    
    let minusButton: UIButton = {
        let button = UIButton()
        button.tintColor = .white
        button.backgroundColor = UIColor(red: 0.306, green: 0.333, blue: 0.843, alpha: 1)
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 5
        button.toAutoLayout()
        return button
    }()


    
    private let layout = UICollectionViewFlowLayout()
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
    //MARK: Methods
    
    private func setupViews() {
        self.toAutoLayout()
        self.backgroundColor = .white
        setupCollectionView()

        
        self.addSubviews(image, nameLabel, priceLabel, descrLabel, starImg, ratingLabel, reviewsLabel, colorLabel, colorStack, bottomView, quantityLabel, addtoCartLabel, addtoCartView, addtoCartLabel, totalPriceLabel, plusButton, minusButton )
        let constrains = [
            
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            image.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            image.heightAnchor.constraint(equalToConstant: 230),
            
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            nameLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            nameLabel.widthAnchor.constraint(equalToConstant: 100),
            nameLabel.heightAnchor.constraint(equalToConstant: 50),
            
            priceLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            
            descrLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            descrLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            descrLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            
            starImg.leadingAnchor.constraint(equalTo: descrLabel.leadingAnchor),
            starImg.topAnchor.constraint(equalTo: descrLabel.bottomAnchor, constant: 20),
            starImg.widthAnchor.constraint(equalToConstant: 15),
            starImg.heightAnchor.constraint(equalToConstant: 15),
            
            ratingLabel.centerYAnchor.constraint(equalTo: starImg.centerYAnchor),
            ratingLabel.leadingAnchor.constraint(equalTo: starImg.trailingAnchor, constant: 2),
            
            reviewsLabel.centerYAnchor.constraint(equalTo: starImg.centerYAnchor),
            reviewsLabel.leadingAnchor.constraint(equalTo: ratingLabel.trailingAnchor, constant: 2),
            
            colorLabel.leadingAnchor.constraint(equalTo: descrLabel.leadingAnchor),
            colorLabel.topAnchor.constraint(equalTo: starImg.bottomAnchor, constant: 20),
            
            colorStack.leadingAnchor.constraint(equalTo: descrLabel.leadingAnchor),
            colorStack.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 20),
            colorLabel.heightAnchor.constraint(equalToConstant: 32),
            
            bottomView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bottomView.topAnchor.constraint(equalTo: colorStack.bottomAnchor, constant: 20),
            
            quantityLabel.leadingAnchor.constraint(equalTo: colorStack.leadingAnchor),
            quantityLabel.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 20),
            
            addtoCartView.topAnchor.constraint(equalTo: quantityLabel.topAnchor),
            addtoCartView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            addtoCartView.widthAnchor.constraint(equalToConstant: 170),
            addtoCartView.heightAnchor.constraint(equalToConstant: 44),
            
            addtoCartLabel.centerYAnchor.constraint(equalTo: addtoCartView.centerYAnchor),
            addtoCartLabel.leadingAnchor.constraint(equalTo: addtoCartView.centerXAnchor),
            
            totalPriceLabel.centerYAnchor.constraint(equalTo: addtoCartView.centerYAnchor),
            totalPriceLabel.leadingAnchor.constraint(equalTo: addtoCartView.leadingAnchor, constant: 30),
            
            minusButton.heightAnchor.constraint(equalToConstant: 20),
            minusButton.widthAnchor.constraint(equalToConstant: 40),
            minusButton.bottomAnchor.constraint(equalTo: addtoCartView.bottomAnchor),
            minusButton.leadingAnchor.constraint(equalTo: quantityLabel.leadingAnchor),
            
            plusButton.heightAnchor.constraint(equalToConstant: 20),
            plusButton.widthAnchor.constraint(equalToConstant: 40),
            plusButton.bottomAnchor.constraint(equalTo: addtoCartView.bottomAnchor),
            plusButton.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor, constant: 15),
            
        

       
        ]
        NSLayoutConstraint.activate(constrains)
        
    }
    
    private func setupCollectionView() {
        self.addSubview(collectionView)
        layout.scrollDirection = .horizontal
        collectionView.toAutoLayout()
        collectionView.register(DetailImageCell.self, forCellWithReuseIdentifier: String(describing: DetailImageCell.self))
        collectionView.dataSource = self
        collectionView.delegate = self
        let constrains = [
            collectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 230),
            collectionView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 75),
            collectionView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -75),
            collectionView.heightAnchor.constraint(equalToConstant: 100),
        ]
        NSLayoutConstraint.activate(constrains)
    }
    
    func updateViewWithData() {
        collectionView.reloadData()
        if let imageUrl = productDetails?.imageUrls[0] {
            image.load(url: URL(string: imageUrl)!)
        }
        nameLabel.text = productDetails?.name
        let priceStr: String = {
            var str = String(productDetails?.price ?? 0)
            str.insert("$", at: str.startIndex)
            return str
        }()
        priceLabel.text = priceStr
        descrLabel.text = productDetails?.description
        if let rating = productDetails?.rating {
            ratingLabel.text = String(describing: rating)
        }
        let numberOfReviews: String = {
            var str = String(productDetails?.numberOfReviews ?? 0)
            str.insert("(", at: str.startIndex)
            str.insert(contentsOf: "reviews )", at: str.endIndex)
            return str
        }()
        reviewsLabel.text = numberOfReviews
        totalPriceLabel.text = priceStr
        
        productDetails?.colors.forEach({ color in
            let colorViewOne: UIView = {
                let view = UIView()
                view.toAutoLayout()
                view.frame = CGRect(x: 0, y: 0, width: 32, height: 24)
                view.layer.masksToBounds = true
                view.layer.cornerRadius = 10
                view.layer.borderWidth = 2
                view.layer.borderColor = UIColor.gray.cgColor
                return view
            }()
            colorViewOne.heightAnchor.constraint(equalToConstant: 24).isActive = true
            colorViewOne.widthAnchor.constraint(equalToConstant: 32).isActive = true
            colorViewOne.backgroundColor = UIColor.hexStringToUIColor(hex: color)
            colorStack.addArrangedSubview(colorViewOne)
        })

        
    }
    //MARK: Init
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
     
    required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
    }
}



extension DetailsView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productDetails?.imageUrls.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: DetailImageCell.self), for: indexPath) as! DetailImageCell
        if let image = productDetails?.imageUrls[indexPath.row] {
            cell.image.load(url: URL(string: image) ?? URL(string: "https://img.ibxk.com.br/2020/09/23/23104013057475.jpg?w=1120&h=420&mode=crop&scale=both")!)
        }
        return cell
    }
}

extension DetailsView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = 90
        let height: CGFloat = 45
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let imageData = productDetails?.imageUrls[indexPath.row] {
            image.load(url: URL(string: imageData) ?? URL(string: "https://img.ibxk.com.br/2020/09/23/23104013057475.jpg?w=1120&h=420&mode=crop&scale=both")!)
        }
    }
}



