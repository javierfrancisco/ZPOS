//
//  Product+CoreDataProperties.swift
//  ZPOS
//
//  Created by zenkiu on 4/26/17.
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
    @NSManaged public var productToMenu: Menu?
    @NSManaged public var productToOrder: NSSet?
    @NSManaged public var productToProductExtra: NSSet?
    @NSManaged public var productToProductSize: NSSet?
    @NSManaged public var productToProductSubtype: ProductSubtype?
    @NSManaged public var productToProductType: ProductType?

}

// MARK: Generated accessors for productToOrder
extension Product {

    @objc(addProductToOrderObject:)
    @NSManaged public func addToProductToOrder(_ value: Order)

    @objc(removeProductToOrderObject:)
    @NSManaged public func removeFromProductToOrder(_ value: Order)

    @objc(addProductToOrder:)
    @NSManaged public func addToProductToOrder(_ values: NSSet)

    @objc(removeProductToOrder:)
    @NSManaged public func removeFromProductToOrder(_ values: NSSet)

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
