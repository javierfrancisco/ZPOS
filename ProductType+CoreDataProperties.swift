//
//  ProductType+CoreDataProperties.swift
//  ZPOS
//
//  Created by zenkiu on 5/1/17.
//  Copyright © 2017 zenkiu. All rights reserved.
//

import Foundation
import CoreData


extension ProductType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductType> {
        return NSFetchRequest<ProductType>(entityName: "ProductType")
    }

    @NSManaged public var createDate: NSDate?
    @NSManaged public var name: String?
    @NSManaged public var typeDescription: String?
    @NSManaged public var productTypeToProductSubtype: NSSet?
    @NSManaged public var productTypeToMenu: Menu?

}

// MARK: Generated accessors for productTypeToProductSubtype
extension ProductType {

    @objc(addProductTypeToProductSubtypeObject:)
    @NSManaged public func addToProductTypeToProductSubtype(_ value: ProductSubtype)

    @objc(removeProductTypeToProductSubtypeObject:)
    @NSManaged public func removeFromProductTypeToProductSubtype(_ value: ProductSubtype)

    @objc(addProductTypeToProductSubtype:)
    @NSManaged public func addToProductTypeToProductSubtype(_ values: NSSet)

    @objc(removeProductTypeToProductSubtype:)
    @NSManaged public func removeFromProductTypeToProductSubtype(_ values: NSSet)

}
