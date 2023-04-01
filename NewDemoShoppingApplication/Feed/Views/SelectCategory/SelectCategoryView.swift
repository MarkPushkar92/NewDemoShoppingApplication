//
//  SelectCategoryView.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 16.03.2023.
//

import UIKit

class SelectCategoryView: UITableViewHeaderFooterView {
    
    //MARK: Properties
    
    let searchTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "What are you looking for?"
        textfield.textAlignment = .center
        textfield.backgroundColor = .white
        textfield.textColor = .gray
        textfield.clipsToBounds = false
        textfield.layer.cornerRadius = 15
        textfield.font = UIFont(name: "Montserrat-Regular", size: 12)
        textfield.toAutoLayout()
        return textfield
    }()

    private let textfiledSubViewIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "magnifyingglass")?.withRenderingMode(.alwaysOriginal)
        image.toAutoLayout()
        return image
    }()
    
    private let layout = UICollectionViewFlowLayout()
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
       
    //MARK: Methods
    
    private func setupViews() {

        searchTextField.addSubview(textfiledSubViewIcon)

        self.addSubviews(searchTextField, collectionView)
        let constrains = [

            searchTextField.widthAnchor.constraint(equalToConstant: 300),
            searchTextField.heightAnchor.constraint(equalToConstant: 34),
            searchTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            searchTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 25),

            textfiledSubViewIcon.widthAnchor.constraint(equalToConstant: 16),
            textfiledSubViewIcon.heightAnchor.constraint(equalToConstant: 16),
            textfiledSubViewIcon.centerYAnchor.constraint(equalTo: searchTextField.centerYAnchor),
            textfiledSubViewIcon.leadingAnchor.constraint(equalTo: searchTextField.trailingAnchor, constant: -24),
            
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            collectionView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 10)

        ]
        NSLayoutConstraint.activate(constrains)
        
        layout.scrollDirection = .horizontal
        collectionView.alwaysBounceHorizontal = true
        collectionView.toAutoLayout()
        collectionView.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        collectionView.register(SelectCategoryCell.self, forCellWithReuseIdentifier: String(describing: SelectCategoryCell.self))
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    //MARK: Init
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
     
    required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
    }
}

extension SelectCategoryView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SelectCategoryCell.self), for: indexPath) as! SelectCategoryCell
        switch indexPath.row {
        case 0:
            cell.button.setImage(UIImage(named: "phones"), for: .normal)
            cell.label.text = "Phones"
        case 1:
            cell.button.setImage(UIImage(named: "headPhones"), for: .normal)
            cell.label.text = "Headphones"
        case 2:
            cell.button.setImage(UIImage(named: "games"), for: .normal)
            cell.label.text = "Games"
        case 3:
            cell.button.setImage(UIImage(named: "cars"), for: .normal)
            cell.label.text = "Cars"
        case 4:
            cell.button.setImage(UIImage(named: "furniture"), for: .normal)
            cell.label.text = "Furniture"
        case 5:
            cell.button.setImage(UIImage(named: "kids"), for: .normal)
            cell.label.text = "Kids"
        default:
            cell.button.setImage(UIImage(named: "games"), for: .normal)
            cell.label.text = "Phones"
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

extension SelectCategoryView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width: CGFloat = 55
        let height: CGFloat = 60
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}


