//
//  Order+CoreDataProperties.swift
//  ZPOS
//
//  Created by zenkiu on 4/26/17.
//  Copyright © 2017 zenkiu. All rights reserved.
//

import Foundation
import CoreData


extension Order {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Order> {
        return NSFetchRequest<Order>(entityName: "Order")
    }

    @NSManaged public var createDate: NSDate?
    @NSManaged public var email: String?
    @NSManaged public var tax: Double
    @NSManaged public var total: Double
    @NSManaged public var orderToProduct: NSSet?
    @NSManaged public var orderToProductOrder: NSSet?
    @NSManaged public var orderToUser: User?

}

// MARK: Generated accessors for orderToProduct
extension Order {

    @objc(addOrderToProductObject:)
    @NSManaged public func addToOrderToProduct(_ value: Product)

    @objc(removeOrderToProductObject:)
    @NSManaged public func removeFromOrderToProduct(_ value: Product)

    @objc(addOrderToProduct:)
    @NSManaged public func addToOrderToProduct(_ values: NSSet)

    @objc(removeOrderToProduct:)
    @NSManaged public func removeFromOrderToProduct(_ values: NSSet)

}

// MARK: Generated accessors for orderToProductOrder
extension Order {

    @objc(addOrderToProductOrderObject:)
    @NSManaged public func addToOrderToProductOrder(_ value: ProductOrder)

    @objc(removeOrderToProductOrderObject:)
    @NSManaged public func removeFromOrderToProductOrder(_ value: ProductOrder)

    @objc(addOrderToProductOrder:)
    @NSManaged public func addToOrderToProductOrder(_ values: NSSet)

    @objc(removeOrderToProductOrder:)
    @NSManaged public func removeFromOrderToProductOrder(_ values: NSSet)

}
