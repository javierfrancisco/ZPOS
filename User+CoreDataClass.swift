//
//  User+CoreDataClass.swift
//  ZPOS
//
//  Created by zenkiu on 4/29/17.
//  Copyright © 2017 zenkiu. All rights reserved.
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject {

    
    convenience init(firstname: String, lastname: String, username: String, context: NSManagedObjectContext) {
        
        // An EntityDescription is an object that has access to all
        // the information you provided in the Entity part of the model
        // you need it to create an instance of this class.
        if let ent = NSEntityDescription.entity(forEntityName: "User", in: context) {
            self.init(entity: ent, insertInto: context)
            self.firstName = firstname
            self.lastName = lastname
            self.username = username
            self.createDate = Date() as NSDate
            
        } else {
            fatalError("Unable to find Entity name!")
        }
    }

}
