//
//  ViewController.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 13.03.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var profileViewModel: ProfilelViewModel
    
    private let headerview = ProfileHeaderView()
    
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
    
    private let returnButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "arrow.left"), for: .normal)
        button.tintColor = .black
        button.toAutoLayout()
        return button
    }()
    
    @objc private func logout() {
        
        profileViewModel.logOut()
    }
    
    @objc func handleTapOnHeader() {
        let photoLibImage = UIImage(named: "photo")
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let photo = UIAlertAction(title: "Photo", style: .default) { _ in
            self.chooseImagePicker(source: .photoLibrary)
        }
        photo.setValue(photoLibImage, forKey: "image")
        photo.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        actionSheet.addAction(photo)
        actionSheet.addAction(cancel)
        present(actionSheet, animated: true)
    }
    
    
    
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

private extension ProfileViewController {
    func setupViews() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: returnButton)
        returnButton.addTarget(self, action: #selector(logout), for: .touchUpInside)
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
        
        if profileViewModel.user?.image != nil {
            guard let imagedata = profileViewModel.user?.image else { return }
            headerview.imageView.image = UIImage(data: imagedata )
        }
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
            cell.imageChevron.isHidden = false
            cell.balanceLabel.isHidden = true
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
        let headerview = headerview
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapOnHeader))
        tapRecognizer.delegate = self
        tapRecognizer.numberOfTapsRequired = 2
        tapRecognizer.numberOfTouchesRequired = 1
        headerview.addGestureRecognizer(tapRecognizer)
        return headerview
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 250
    }
}

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 65
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 6 {
            logout()
        }
    }
}

//MARK: EXTENSION WORKING WITH IMAGES

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate {
    
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as? UIImage
        headerview.imageView.image = image
        headerview.imageView.clipsToBounds = true
        headerview.imageView.contentMode = .scaleAspectFill
        if let user = profileViewModel.user {
            user.image = image?.pngData()
            profileViewModel.coreDataStack?.upDateUser(user: user)
        }
       
        tableView.reloadData()
        
        dismiss(animated: true)
    }
}





  
