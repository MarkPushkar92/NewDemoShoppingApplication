//
//  LatestTableCell.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 16.03.2023.
//

import UIKit

class LatestTableCell: UITableViewCell {
    
    //MARK: Properties
    
    var OnTap: (() -> (Void))?
    
    var latest: [Latest] = []
    
    private let latestLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 25)
        label.textAlignment = .center
        label.text = "Latest"
        label.toAutoLayout()
        return label
    }()
    
    private let viewAllLabel: UILabel = {
        var view = UILabel()
        view.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        view.textColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1)
        view.font = UIFont.systemFont(ofSize: 15)
        view.textAlignment = .center
        view.text = "View all"
        view.toAutoLayout()
        return view
    }()
    
    private let layout = UICollectionViewFlowLayout()
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
   
    
    //MARK: Init and View Setup
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        layout.scrollDirection = .vertical
        collectionView.toAutoLayout()
        collectionView.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        collectionView.register(LatestCollectionCell.self, forCellWithReuseIdentifier: String(describing: LatestCollectionCell.self))
        collectionView.dataSource = self
        collectionView.delegate = self
        backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        addSubviews(viewAllLabel, latestLabel, collectionView)
        
        let constrains = [
      
            latestLabel.heightAnchor.constraint(equalToConstant: 32),
            latestLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 17),
            latestLabel.topAnchor.constraint(equalTo: self.topAnchor),
          
            viewAllLabel.heightAnchor.constraint(equalToConstant: 19),
            viewAllLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 317),
            viewAllLabel.bottomAnchor.constraint(equalTo: latestLabel.bottomAnchor),
            
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: latestLabel.bottomAnchor, constant: 10),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constrains)
        
    }
}

//MARK: Collection Extension

extension LatestTableCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return latest.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: LatestCollectionCell.self), for: indexPath) as! LatestCollectionCell
        let object = latest[indexPath.row]
        cell.nameLabel.text = object.name
        cell.priceLabel.text = String(object.price)
        cell.categoryLabel.text = object.category
        cell.image.load(url: URL(string: object.imageURL) ?? URL(string: "https://img.ibxk.com.br/2020/09/23/23104013057475.jpg?w=1120&h=420&mode=crop&scale=both")!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let OnTap else { return }
        OnTap()
    }
}

extension LatestTableCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width: CGFloat = collectionView.bounds.width / 2 - 28
        let height: CGFloat = 227
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 12, left: 14, bottom: 12, right: 14)
    }
}

