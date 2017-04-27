//
//  ProductOrderSize+CoreDataProperties.swift
//  ZPOS
//
//  Created by zenkiu on 4/26/17.
//  Copyright © 2017 zenkiu. All rights reserved.
//

import Foundation
import CoreData


extension ProductOrderSize {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductOrderSize> {
        return NSFetchRequest<ProductOrderSize>(entityName: "ProductOrderSize")
    }

    @NSManaged public var createDate: NSDate?
    @NSManaged public var name: String?
    @NSManaged public var price: Double
    @NSManaged public var productOrderSizeToProductOrder: ProductOrder?

}
