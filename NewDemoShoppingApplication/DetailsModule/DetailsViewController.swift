//
//  DetailsViewController.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 22.03.2023.
//

import UIKit

class DetailsViewController: UIViewController {
    
    weak var coordinator: FeedCoordinator?
    
    var detailsViewModel: DetailsViewModel
        
    private var counter = 1
    
    //MARK: UI props
    
    private let detailsView = DetailsView()

    
    //MARK: FUNCS
    
    @objc private func minusButtonPressed() {
        counter -= 1
        let priceStr: String = {
            var str = String((detailsViewModel.productDetails?.price ?? 0)*counter)
            str.insert("$", at: str.startIndex)
            return str
        }()
        detailsView.totalPriceLabel.text = priceStr
    }
    
    @objc private func plusButtonPressed() {
        counter += 1
        let priceStr: String = {
            var str = String((detailsViewModel.productDetails?.price ?? 0)*counter)
            str.insert("$", at: str.startIndex)
            return str
        }()
        detailsView.totalPriceLabel.text = priceStr
    }
       
    //MARK: Init and LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black

    }
    
    init(detailsViewModel: DetailsViewModel) {
        self.detailsViewModel = detailsViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    } 

}

extension DetailsViewController {
    func setupViews() {
        detailsView.minusButton.addTarget(self, action: #selector(minusButtonPressed), for: .touchUpInside)
        detailsView.plusButton.addTarget(self, action: #selector(plusButtonPressed), for: .touchUpInside)
        view.backgroundColor = .white
        view.addSubview(detailsView)
        let constraints = [
        
            detailsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        
        ]
        NSLayoutConstraint.activate(constraints)
        
        detailsView.productDetails = detailsViewModel.productDetails
        detailsView.updateViewWithData()
              
   }
   
   
   
   
   
}
