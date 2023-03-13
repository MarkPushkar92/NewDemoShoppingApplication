//
//  Cordinator.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 11.03.2023.
//

import Foundation

protocol Coordinator: AnyObject {
    var coordinators: [Coordinator] { get set }
}
