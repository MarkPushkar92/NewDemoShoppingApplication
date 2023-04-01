//
//  SearchResultController.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 21.03.2023.
//

import UIKit



class ResultsTableView: UIView {
    
    var searchedWords = [String]()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.toAutoLayout()
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    let button: UIButton = {
        let view = UIButton()
        view.toAutoLayout()
        view.setImage(UIImage(systemName: "xmark")?.withTintColor(.gray, renderingMode: .alwaysOriginal), for: .normal)
        return view
    }()
    
    private func setupViews() {
   
        self.layer.cornerRadius = 25
        self.layer.masksToBounds = true
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor.gray.cgColor
        self.toAutoLayout()
        self.addSubview(tableView)
        tableView.addSubview(button)
        let constraints = [
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            button.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ]
        NSLayoutConstraint.activate(constraints)

        
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

extension ResultsTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchedWords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = searchedWords[indexPath.row]
        return cell
    }
}

extension ResultsTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
}
