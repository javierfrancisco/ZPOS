//
//  ProductExtra+CoreDataProperties.swift
//  ZPOS
//
//  Created by zenkiu on 4/29/17.
//  Copyright © 2017 zenkiu. All rights reserved.
//

import Foundation
import CoreData


extension ProductExtra {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductExtra> {
        return NSFetchRequest<ProductExtra>(entityName: "ProductExtra")
    }

    @NSManaged public var extraDescription: String?
    @NSManaged public var name: String?
    @NSManaged public var price: Double
    @NSManaged public var productExtraToProduct: Product?

}
