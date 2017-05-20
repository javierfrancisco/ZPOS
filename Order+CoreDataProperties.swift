//
//  Order+CoreDataProperties.swift
//  ZPOS
//
//  Created by zenkiu on 4/29/17.
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
    @NSManaged public var orderToUser: User?
    @NSManaged public var orderToProductOrder: NSSet?

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
