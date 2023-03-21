//
//  UserModel+CoreDataProperties.swift
//  NewDemoShoppingApplication
//
//  Created by Марк Пушкарь on 19.03.2023.
//

import Foundation
import CoreData


extension UserModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserModel> {
        return NSFetchRequest<UserModel>(entityName: "UserModel")
    }


    @NSManaged public var name: String
    @NSManaged public var lastName: String
    @NSManaged public var email: String
    @NSManaged public var password: String
    @NSManaged public var image: Data?
    
}

extension UserModel : Identifiable {

}
