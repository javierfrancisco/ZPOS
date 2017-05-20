//
//  ProductOrder+CoreDataClass.swift
//  ZPOS
//
//  Created by zenkiu on 4/29/17.
//  Copyright © 2017 zenkiu. All rights reserved.
//

import Foundation
import CoreData

@objc(ProductOrder)
public class ProductOrder: NSManagedObject {

    
    
    
    convenience init(price: Double, size: String, quantity: Int, total : Double, context: NSManagedObjectContext) {
        
        // An EntityDescription is an object that has access to all
        // the information you provided in the Entity part of the model
        // you need it to create an instance of this class.
        if let ent = NSEntityDescription.entity(forEntityName: "ProductOrder", in: context) {
            self.init(entity: ent, insertInto: context)
            self.price = price
           // self.size = size
            //self.quantity = quantity
            self.total = total
            self.createDate = Date() as NSDate
            
        } else {
            fatalError("Unable to find Entity name!")
        }
    }

    
    
}
