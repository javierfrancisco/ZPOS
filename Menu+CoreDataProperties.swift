//
//  Menu+CoreDataProperties.swift
//  ZPOS
//
//  Created by zenkiu on 5/1/17.
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
    @NSManaged public var menuToProductType: NSSet?

}

// MARK: Generated accessors for menuToProductType
extension Menu {

    @objc(addMenuToProductTypeObject:)
    @NSManaged public func addToMenuToProductType(_ value: ProductType)

    @objc(removeMenuToProductTypeObject:)
    @NSManaged public func removeFromMenuToProductType(_ value: ProductType)

    @objc(addMenuToProductType:)
    @NSManaged public func addToMenuToProductType(_ values: NSSet)

    @objc(removeMenuToProductType:)
    @NSManaged public func removeFromMenuToProductType(_ values: NSSet)

}
