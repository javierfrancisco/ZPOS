//
//  User+CoreDataProperties.swift
//  ZPOS
//
//  Created by zenkiu on 4/26/17.
//  Copyright © 2017 zenkiu. All rights reserved.
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var createDate: NSDate?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var password: String?
    @NSManaged public var role: String?
    @NSManaged public var username: String?
    @NSManaged public var userToOrder: NSSet?

}

// MARK: Generated accessors for userToOrder
extension User {

    @objc(addUserToOrderObject:)
    @NSManaged public func addToUserToOrder(_ value: Order)

    @objc(removeUserToOrderObject:)
    @NSManaged public func removeFromUserToOrder(_ value: Order)

    @objc(addUserToOrder:)
    @NSManaged public func addToUserToOrder(_ values: NSSet)

    @objc(removeUserToOrder:)
    @NSManaged public func removeFromUserToOrder(_ values: NSSet)

}
