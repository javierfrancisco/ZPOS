//
//  ProductSize+CoreDataClass.swift
//  ZPOS
//
//  Created by zenkiu on 4/29/17.
//  Copyright © 2017 zenkiu. All rights reserved.
//

import Foundation
import CoreData

@objc(ProductSize)
public class ProductSize: NSManagedObject {

    
    convenience init(name: String, price: Double, context: NSManagedObjectContext) {
        
        // An EntityDescription is an object that has access to all
        // the information you provided in the Entity part of the model
        // you need it to create an instance of this class.
        if let ent = NSEntityDescription.entity(forEntityName: "ProductSize", in: context) {
            self.init(entity: ent, insertInto: context)
            self.name = name
            self.price = price
            self.createDate = Date() as NSDate
            
        } else {
            fatalError("Unable to find Entity name!")
        }
    }
    
    
}
