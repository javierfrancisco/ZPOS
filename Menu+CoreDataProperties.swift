//
//  Menu+CoreDataProperties.swift
//  ZPOS
//
//  Created by zenkiu on 4/26/17.
//  Copyright © 2017 zenkiu. All rights reserved.
//

import Foundation
import CoreData


extension Menu {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Menu> {
        return NSFetchRequest<Menu>(entityName: "Menu")
    }

    @NSManaged public var createDate: NSDecimalNumber?
    @NSManaged public var menuDescription: String?
    @NSManaged public var name: String?
    @NSManaged public var menuToProduct: NSSet?

}

// MARK: Generated accessors for menuToProduct
extension Menu {

    @objc(addMenuToProductObject:)
    @NSManaged public func addToMenuToProduct(_ value: Product)

    @objc(removeMenuToProductObject:)
    @NSManaged public func removeFromMenuToProduct(_ value: Product)

    @objc(addMenuToProduct:)
    @NSManaged public func addToMenuToProduct(_ values: NSSet)

    @objc(removeMenuToProduct:)
    @NSManaged public func removeFromMenuToProduct(_ values: NSSet)

}
