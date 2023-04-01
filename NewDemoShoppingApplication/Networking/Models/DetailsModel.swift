//
//  DetailsModel.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 01.04.2023.
//

import Foundation

protocol DetailsModelType: AnyObject {
    
    var name: String { get }
    var description: String { get }
    var rating: Double { get }
    var numberOfReviews: Int { get }
    var price: Int { get }
    var colors: [String] { get }
    var imageUrls: [String] { get }
    
}

class DetailsModel: DetailsModelType {
    var name: String {
        return details.name
    }
    
    var description: String {
        return details.description
    }
    
    var rating: Double {
        return details.rating
    }
    
    var numberOfReviews: Int {
        return details.numberOfReviews
    }
    
    var price: Int {
        return details.price
    }
    
    var colors: [String] {
        return details.colors
    }
    
    var imageUrls: [String] {
        return details.imageUrls
    }
    
    private var details: ProductDetails
    
    init(details: ProductDetails) {
        self.details = details
    }
}
