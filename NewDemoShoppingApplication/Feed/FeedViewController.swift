//
//  FeedViewController.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 13.03.2023.
//

import UIKit


class FeedViewController: UIViewController {
    
    weak var coordinator: FeedCoordinator?
    
    private var feedViewModel: FeedViewModel
    
    private let headerview = SelectCategoryView()
    
    private var latestDeals = [Latest]()

    private var flashSale = [FlashSale]()
    //MARK: UI props
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        tableView.toAutoLayout()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(LatestTableCell.self, forCellReuseIdentifier: cellIDLatest)
        tableView.register(FlashSaleTableCell.self, forCellReuseIdentifier: cellIDSale)
        return tableView
    }()
    
    private let cellIDLatest = "cellIDLatest"
    
    private let cellIDSale = "cellIDSale"
    
    //MARK: FUNCS
    
    @objc private func headerButtonTapped(button: CustomButton) {
        print("hi circle button")
        
    }
    
    private func getData() {
        feedViewModel.networking.getData {  latest, sale in
            if latest.isEmpty || sale.isEmpty {
                print("no data")
            } else {
                self.latestDeals = latest
                self.flashSale = sale
                self.applyData()
            }
        }
    }
    
    private func applyData() {
        
        DispatchQueue.main.async {
           
            if let cell = self.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? LatestTableCell {
               cell.collectionView.reloadData()
            }
            if let cell1 = self.tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? FlashSaleTableCell {
               cell1.collectionView.reloadData()
            }
            if let cell = self.tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as? LatestTableCell {
               cell.collectionView.reloadData()
            }
            self.tableView.reloadData()

        }
    }
    
    //MARK: Init and LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        setupViews()
        getData()
        
    }
    
    init(feedViewModel: FeedViewModel) {
        self.feedViewModel = feedViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


 

}



//MARK: EXTENSIONS

private extension FeedViewController {
    func setupViews() {
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        view.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        let constraints = [
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
     
        ]
        NSLayoutConstraint.activate(constraints)
        setupNavigation()
    }
    
    
}


extension FeedViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIDLatest, for: indexPath) as! LatestTableCell
            cell.latestLabel.text = "Latest"
            cell.latest = latestDeals
            cell.selectionStyle = .none
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIDLatest, for: indexPath) as! LatestTableCell
            cell.latest = latestDeals
            cell.latestLabel.text = "Brands"
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIDSale, for: indexPath) as! FlashSaleTableCell
            cell.flashSale = flashSale
            cell.selectionStyle = .none
            return cell
        }
    }

    //MARK: EXTENSIONS TABLEVIEW DATA SOURCE (HEADER)
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        headerview.phonesButton.addTarget(self, action: #selector(headerButtonTapped), for: .touchUpInside)
        headerview.headPhonesButton.addTarget(self, action: #selector(headerButtonTapped), for: .touchUpInside)
        headerview.gamesButton.addTarget(self, action: #selector(headerButtonTapped), for: .touchUpInside)
        headerview.carsButton.addTarget(self, action: #selector(headerButtonTapped), for: .touchUpInside)
        headerview.furnitureButton.addTarget(self, action: #selector(headerButtonTapped), for: .touchUpInside)
        headerview.kidsButton.addTarget(self, action: #selector(headerButtonTapped), for: .touchUpInside)
        return headerview
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 150
    }
}

extension FeedViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 || indexPath.row == 2 {
            return 220
        } else {
            return 270
        }
    }
}





  
