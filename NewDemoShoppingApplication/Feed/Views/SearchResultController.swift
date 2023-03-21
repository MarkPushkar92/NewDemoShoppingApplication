//
//  SearchResultController.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 21.03.2023.
//

import UIKit

class ResultsVC: UITableViewController {
    
    var searchedWords = [String]()

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchedWords.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = searchedWords[indexPath.row]
        return cell
    }
}
