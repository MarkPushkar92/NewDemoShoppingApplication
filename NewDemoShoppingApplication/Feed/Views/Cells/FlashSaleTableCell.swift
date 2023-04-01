//
//  FlashSaleTableCell.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 17.03.2023.
//

import UIKit

class FlashSaleTableCell: UITableViewCell {
    
    //MARK: Properties
    
    var OnTap: (() -> (Void))?
    
    var flashSale: [SaleModel] = []
    
    private let flashSaleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        label.textColor = .black
        label.font = UIFont(name: "Montserrat-Bold", size: 22)
        label.textAlignment = .center
        label.text = "Flash Sale"
        label.toAutoLayout()
        return label
    }()
    
    private let viewAllLabel: UILabel = {
        var view = UILabel()
        view.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        view.textColor = .gray
        view.font = UIFont(name: "Montserrat-Medium", size: 15)
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
        collectionView.alwaysBounceHorizontal = true
        layout.scrollDirection = .horizontal
        collectionView.toAutoLayout()
        collectionView.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        collectionView.register(ReusableCollectionCell.self, forCellWithReuseIdentifier: String(describing: ReusableCollectionCell.self))
        collectionView.dataSource = self
        collectionView.delegate = self
        backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        contentView.addSubviews(viewAllLabel, flashSaleLabel, collectionView)
        
        let constrains = [
      
            flashSaleLabel.heightAnchor.constraint(equalToConstant: 32),
            flashSaleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 17),
            flashSaleLabel.topAnchor.constraint(equalTo: self.topAnchor),
          
            viewAllLabel.heightAnchor.constraint(equalToConstant: 19),
            viewAllLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 317),
            viewAllLabel.bottomAnchor.constraint(equalTo: flashSaleLabel.bottomAnchor),
            
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: flashSaleLabel.bottomAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constrains)
        
    }
}

//MARK: Collection Extension

extension FlashSaleTableCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return flashSale.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ReusableCollectionCell.self), for: indexPath) as! ReusableCollectionCell
        let object = flashSale[indexPath.row]
        cell.nameLabel.text = object.name
        let priceStr: String = {
            var str = String(object.price)
            if str.count >= 4 {
                str.insert(",", at: str.index(str.endIndex, offsetBy: -3))
            }
            str.insert("$", at: str.startIndex)
            return str
        }()
        
        cell.priceLabel.text = priceStr
        cell.categoryLabel.text = object.category
        cell.image.load(url: URL(string: object.imageURL) ?? URL(string: "https://img.ibxk.com.br/2020/09/23/23104013057475.jpg?w=1120&h=420&mode=crop&scale=both")!)
        cell.discountImg.isHidden = false
        cell.heartButton.isHidden = false
        cell.discountLAbel.isHidden = false
        
        let discountStr: String = {
            var str = String(object.discount)
            str.insert(contentsOf: "% off", at: str.endIndex)
            return str
        }()
        cell.discountLAbel.text = discountStr
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let OnTap else { return }
        OnTap()
    }
}

extension FlashSaleTableCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width: CGFloat = collectionView.bounds.width / 2 - 30
        let height: CGFloat = 221
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}

