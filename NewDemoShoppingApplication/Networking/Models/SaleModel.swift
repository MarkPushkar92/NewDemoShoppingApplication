//
//  SaleModel.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 01.04.2023.
//

import Foundation

protocol SaleModelType: AnyObject {
    
    var category: String { get }
    var name: String { get }
    var price: Double { get }
    var discount: Int { get }
    var imageURL: String { get }
    
}

class SaleModel: SaleModelType {
    
    var category: String {
        return sale.category
    }
        
    var name: String {
        return sale.name
    }
        
    var price: Double {
        return sale.price
    }
    
    var discount: Int {
        return sale.discount
    }
        
    var imageURL: String {
        return sale.imageURL
    }
        
    private var sale: FlashSale
    
    init(sale: FlashSale) {
        self.sale = sale
    }
}
