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
    
    //MARK: Search properties and func
    
    private let resultsTableView = ResultsTableView()
        
    private var timer: Timer?
    
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
    
  
    @objc private func removeresultsView() {
        resultsTableView.isHidden = true
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

 extension FeedViewController: UIGestureRecognizerDelegate {
    func setupViews() {
        headerview.searchTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        headerview.searchTextField.delegate = self
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
        
        // results tableView setup
        view.addSubview(resultsTableView)
        resultsTableView.isHidden = true
        resultsTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        resultsTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        resultsTableView.bottomAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -100).isActive = true
        resultsTableView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        resultsTableView.button.addTarget(self, action: #selector(removeresultsView), for: .touchUpInside)
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
            cell.OnTap = feedViewModel.onTapShowNextModule
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIDLatest, for: indexPath) as! LatestTableCell
            cell.latest = latestDeals
            cell.latestLabel.text = "Brands"
            cell.selectionStyle = .none
            cell.OnTap = feedViewModel.onTapShowNextModule
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIDSale, for: indexPath) as! FlashSaleTableCell
            cell.flashSale = flashSale
            cell.selectionStyle = .none
            cell.OnTap = feedViewModel.onTapShowNextModule
            return cell
        }
    }

    //MARK: EXTENSIONS TABLEVIEW DATA SOURCE (HEADER)
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
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

extension FeedViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        resultsTableView.isHidden = false
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { _ in
            
            self.feedViewModel.networking.fetchSearchWords { [self] searched in
                guard let searched = searched else { return }
                self.resultsTableView.searchedWords = searched.words.filter{ $0.contains(textField.text ?? "")
                }
                self.resultsTableView.tableView.reloadData()
            }
        })
    }
    
    
}


