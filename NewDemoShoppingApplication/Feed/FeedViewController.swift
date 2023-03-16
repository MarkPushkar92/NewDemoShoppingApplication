//
//  MockVC.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 13.03.2023.
//

import UIKit


class FeedViewController: UIViewController {
    
    weak var coordinator: FeedCoordinator?
    
    private var feedViewModel: FeedViewModel
    
    private let headerview = SelectCategoryView()

    //MARK: UI props
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        tableView.toAutoLayout()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(LatestTableCell.self, forCellReuseIdentifier: cellIDLatest)
        tableView.register(SalesTableViewCell.self, forCellReuseIdentifier: cellIDSale)
        return tableView
    }()
    
    private let cellIDLatest = "cellIDLatest"
    
    private let cellIDSale = "cellIDSale"
    
    //MARK: FUNCS
    
    @objc private func headerButtonTapped(button: CustomButton) {
        print("hi circle button")
        if CustomButton.buttonArray.isEmpty {
            button.backgroundColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1)
            CustomButton.buttonArray.append(button)
        } else {
            for i in CustomButton.buttonArray {
                i.backgroundColor = .white
                CustomButton.buttonArray.removeAll()
            }
            button.backgroundColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1)
            CustomButton.buttonArray.append(button)
        }
    }
    
    //MARK: Init and LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        setupViews()
        
        
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
    }
}

extension FeedViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIDLatest, for: indexPath) as! LatestTableCell
           
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIDSale, for: indexPath) as! SalesTableViewCell
      
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
        if indexPath.row == 0 {
            return 300
        } else {
            return 500
        }
    }
}





  
