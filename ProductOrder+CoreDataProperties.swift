//
//  ProductOrder+CoreDataProperties.swift
//  ZPOS
//
//  Created by zenkiu on 4/29/17.
//  Copyright © 2017 zenkiu. All rights reserved.
//

import Foundation
import CoreData


extension ProductOrder {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductOrder> {
        return NSFetchRequest<ProductOrder>(entityName: "ProductOrder")
    }

    @NSManaged public var createDate: NSDate?
    @NSManaged public var quantity: Int16
    @NSManaged public var total: Double
    @NSManaged public var unitPrice: Double
    @NSManaged public var productSize: String?
    @NSManaged public var price: Double
    @NSManaged public var productOrderToOrder: Order?
    @NSManaged public var productOrderToProductOrderExtra: ProductOrderExtra?
    @NSManaged public var productOrderToProduct: Product?

}
