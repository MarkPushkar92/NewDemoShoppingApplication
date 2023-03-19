//
//  SignINDelegate.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 19.03.2023.
//

import Foundation

protocol SignINDelegate: AnyObject {
    
    var coreDataStack: CoreDataStack { get }
    
    func checkIfUserExists(email: String) -> Bool
    
    func checkIfEmailIsValid(email: String) -> Bool
    
    func createAccount(name: String?, lastName: String?, email: String?, password: String?) -> Void
    
        
}

class SignInInspector: SignINDelegate {
    
    init(stack: CoreDataStack) {
        self.coreDataStack = stack
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var coreDataStack: CoreDataStack

    func checkIfUserExists(email: String) -> Bool {
        return true
    }
    
    func checkIfEmailIsValid(email: String) -> Bool {
        return true
    }
    
    func createAccount(name: String?, lastName: String?, email: String?, password: String?) {
        
    }
    
    
    
}
