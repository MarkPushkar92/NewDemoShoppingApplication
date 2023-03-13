//
//  ViewController.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 13.03.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var profileViewModel: ProfilelViewModel
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        tableView.toAutoLayout()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: cellID)
        return tableView
    }()
    
    private let cellID = "cellID"
    
    init(profileViewModel: ProfilelViewModel) {
        self.profileViewModel = profileViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    

 

}

//MARK: EXTENSIONS

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ProfileTableViewCell
        switch indexPath.row {
        case 0:
            cell.image.image = UIImage(named: "card")
            cell.titleLabel.text = "Trade Store"
        case 1:
            cell.image.image = UIImage(named: "card")
            cell.titleLabel.text = "Payment method"
        case 2:
            cell.image.image = UIImage(named: "card")
            cell.titleLabel.text = "Balance"
            cell.imageChevron.isHidden = true
            cell.balanceLabel.isHidden = false
        case 3:
            cell.image.image = UIImage(named: "card")
            cell.titleLabel.text = "Trade history"
        case 4:
            cell.image.image = UIImage(named: "spinArrow")
            cell.titleLabel.text = "Restore purchases"
        case 5:
            cell.image.image = UIImage(named: "help")
            cell.titleLabel.text = "Help"
            cell.imageChevron.isHidden = true
        case 6:
            cell.image.image = UIImage(named: "logOut")
            cell.titleLabel.text = "Log Out"
            cell.imageChevron.isHidden = true
        default:
            break
        }
        cell.selectionStyle = .none
        return cell
        
    }

    //MARK: EXTENSIONS TABLEVIEW DATA SOURCE (HEADER)
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerview = ProfileHeaderView()

        return headerview
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 250
    }
}

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 6 {
            navigationController?.popToRootViewController(animated: true)
        }
    }
}

private extension ProfileViewController {
    func setupViews() {
        title = profileViewModel.moduleTitle
        view.backgroundColor = UIColor(red: 0.98, green: 0.976, blue: 1, alpha: 1)
        tableView.backgroundColor = UIColor(red: 0.98, green: 0.976, blue: 1, alpha: 1)
        view.addSubview(tableView)
        tableView.separatorStyle = .none
        let constraints = [
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      
        ]
        NSLayoutConstraint.activate(constraints)
    }
}



  
