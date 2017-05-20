//
//  ProductSubtype+CoreDataProperties.swift
//  ZPOS
//
//  Created by zenkiu on 5/1/17.
//  Copyright © 2017 zenkiu. All rights reserved.
//

import Foundation
import CoreData


extension ProductSubtype {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductSubtype> {
        return NSFetchRequest<ProductSubtype>(entityName: "ProductSubtype")
    }

    @NSManaged public var createDate: NSDate?
    @NSManaged public var name: String?
    @NSManaged public var subtypeDescription: String?
    @NSManaged public var productSubtypeToProduct: NSSet?
    @NSManaged public var productSubtypeToProductType: ProductType?

}

// MARK: Generated accessors for productSubtypeToProduct
extension ProductSubtype {

    @objc(addProductSubtypeToProductObject:)
    @NSManaged public func addToProductSubtypeToProduct(_ value: Product)

    @objc(removeProductSubtypeToProductObject:)
    @NSManaged public func removeFromProductSubtypeToProduct(_ value: Product)

    @objc(addProductSubtypeToProduct:)
    @NSManaged public func addToProductSubtypeToProduct(_ values: NSSet)

    @objc(removeProductSubtypeToProduct:)
    @NSManaged public func removeFromProductSubtypeToProduct(_ values: NSSet)

}
