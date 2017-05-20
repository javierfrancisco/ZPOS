//
//  Product+CoreDataProperties.swift
//  ZPOS
//
//  Created by zenkiu on 5/1/17.
//  Copyright © 2017 zenkiu. All rights reserved.
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var createDate: NSDate?
    @NSManaged public var name: String?
    @NSManaged public var productDescription: String?
    @NSManaged public var productToProductExtra: NSSet?
    @NSManaged public var productToProductOrder: NSSet?
    @NSManaged public var productToProductSize: NSSet?
    @NSManaged public var productToProductSubtype: ProductSubtype?

}

// MARK: Generated accessors for productToProductExtra
extension Product {

    @objc(addProductToProductExtraObject:)
    @NSManaged public func addToProductToProductExtra(_ value: ProductExtra)

    @objc(removeProductToProductExtraObject:)
    @NSManaged public func removeFromProductToProductExtra(_ value: ProductExtra)

    @objc(addProductToProductExtra:)
    @NSManaged public func addToProductToProductExtra(_ values: NSSet)

    @objc(removeProductToProductExtra:)
    @NSManaged public func removeFromProductToProductExtra(_ values: NSSet)

}

// MARK: Generated accessors for productToProductOrder
extension Product {

    @objc(addProductToProductOrderObject:)
    @NSManaged public func addToProductToProductOrder(_ value: ProductOrder)

    @objc(removeProductToProductOrderObject:)
    @NSManaged public func removeFromProductToProductOrder(_ value: ProductOrder)

    @objc(addProductToProductOrder:)
    @NSManaged public func addToProductToProductOrder(_ values: NSSet)

    @objc(removeProductToProductOrder:)
    @NSManaged public func removeFromProductToProductOrder(_ values: NSSet)

}

// MARK: Generated accessors for productToProductSize
extension Product {

    @objc(addProductToProductSizeObject:)
    @NSManaged public func addToProductToProductSize(_ value: ProductSize)

    @objc(removeProductToProductSizeObject:)
    @NSManaged public func removeFromProductToProductSize(_ value: ProductSize)

    @objc(addProductToProductSize:)
    @NSManaged public func addToProductToProductSize(_ values: NSSet)

    @objc(removeProductToProductSize:)
    @NSManaged public func removeFromProductToProductSize(_ values: NSSet)

}
