//
//  ProductSize+CoreDataProperties.swift
//  ZPOS
//
//  Created by zenkiu on 4/29/17.
//  Copyright © 2017 zenkiu. All rights reserved.
//

import Foundation
import CoreData


extension ProductSize {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductSize> {
        return NSFetchRequest<ProductSize>(entityName: "ProductSize")
    }

    @NSManaged public var createDate: NSDate?
    @NSManaged public var name: String?
    @NSManaged public var price: Double
    @NSManaged public var productSizeToProduct: Product?

}
