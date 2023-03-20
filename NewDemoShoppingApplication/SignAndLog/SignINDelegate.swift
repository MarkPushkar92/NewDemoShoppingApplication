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
    
    func checkIfEmailIsValid(email: String?) -> Bool
    
    func createAccount(name: String, lastName: String, email: String, password: String) -> Void
    
    func checkIfNameisComplete(name: String?, lastName: String?) -> Bool
    
    func logIn(name: String, password: String)
    
}

class SignInInspector: SignINDelegate {
  
    private var userArray = [String]()
    
    init(stack: CoreDataStack) {
        self.coreDataStack = stack
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var coreDataStack: CoreDataStack

    func checkIfUserExists(email: String) -> Bool {
        userArray = coreDataStack.fetchTasks().map({
            return $0.email
        })
        return userArray.contains(email)
    }
    
    func checkIfEmailIsValid(email: String?) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func checkIfNameisComplete(name: String?, lastName: String?) -> Bool {
        guard let name = name else {return false}
        guard let lastName = lastName else {return false}
        if name.isEmpty || lastName.isEmpty {
            return false
        } else {
            return true
        }
    }
    
    func createAccount(name: String, lastName: String, email: String, password: String) {
        coreDataStack.createNewUser(name: name, lastName: lastName, email: email, password: password)
    }
    
    func logIn(name: String, password: String) {
        
    }

    
    
}
