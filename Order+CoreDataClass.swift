//
//  Order+CoreDataClass.swift
//  ZPOS
//
//  Created by zenkiu on 4/29/17.
//  Copyright © 2017 zenkiu. All rights reserved.
//

import Foundation
import CoreData

@objc(Order)
public class Order: NSManagedObject {
    
    
    convenience init(user: User, context: NSManagedObjectContext) {
        
        // An EntityDescription is an object that has access to all
        // the information you provided in the Entity part of the model
        // you need it to create an instance of this class.
        if let ent = NSEntityDescription.entity(forEntityName: "Order", in: context) {
            self.init(entity: ent, insertInto: context)

            self.createDate = Date() as NSDate
            self.orderToUser = user
            
        } else {
            fatalError("Unable to find Entity name!")
        }
    }
    
    

}
