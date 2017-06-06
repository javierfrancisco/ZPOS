//
//  ZPOSConvenience.swift
//  ZPOS
//
//  Created by zenkiu on 4/26/17.
//  Copyright © 2017 zenkiu. All rights reserved.
//


import UIKit
import Foundation
import CoreData

// MARK: - TMDBClient (Convenient Resource Methods)

extension ZPOSClient {

    
    
    
    func authenticateUser(_ user: String, _ password : String, _ context: NSManagedObjectContext, completionHandlerForAuth: @escaping (_ success: Bool, _ user: User, _ errorString: String?) -> Void) {
        
        let username = "Username"
        //let password = "user"
        
        var userFound = false
        
        if(user == username){
        
            userFound = true
        }
        
        let user =  User(firstname: "Javier", lastname: "Alvarez", username: "user", context: context)
        
        if(userFound){
        
            completionHandlerForAuth(true, user, nil)
            //this.u
            //this.user = user
        }
        
    }

}
