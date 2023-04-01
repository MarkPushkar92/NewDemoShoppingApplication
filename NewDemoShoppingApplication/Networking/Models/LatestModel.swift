//
//  LatestModel.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 01.04.2023.
//

import Foundation


protocol LatestModelType: AnyObject {
       
    var category: String { get }
    var name: String { get }
    var price: Int { get }
    var imageURL: String { get }
}

class LatestModel: LatestModelType {
    
    var category: String {
        return latest.category
    }
    
    var name: String {
        return latest.name
    }
    
    var price: Int {
        return latest.price
    }
    
    var imageURL: String {
        return latest.imageURL
    }
        
    private var latest: Latest
    
    init(latest: Latest) {
        self.latest = latest
    }
}
