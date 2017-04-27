//
//  ProductType+CoreDataProperties.swift
//  ZPOS
//
//  Created by zenkiu on 4/26/17.
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
    @NSManaged public var productTypeToProduct: NSSet?

}

// MARK: Generated accessors for productTypeToProduct
extension ProductType {

    @objc(addProductTypeToProductObject:)
    @NSManaged public func addToProductTypeToProduct(_ value: Product)

    @objc(removeProductTypeToProductObject:)
    @NSManaged public func removeFromProductTypeToProduct(_ value: Product)

    @objc(addProductTypeToProduct:)
    @NSManaged public func addToProductTypeToProduct(_ values: NSSet)

    @objc(removeProductTypeToProduct:)
    @NSManaged public func removeFromProductTypeToProduct(_ values: NSSet)

}
