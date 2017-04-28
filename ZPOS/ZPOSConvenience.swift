//
//  ZPOSConvenience.swift
//  ZPOS
//
//  Created by zenkiu on 4/26/17.
//  Copyright © 2017 zenkiu. All rights reserved.
//


import UIKit
import Foundation

// MARK: - TMDBClient (Convenient Resource Methods)

extension ZPOSClient {

    

    
    
    func authenticateUser(_ user: String, _ password : String, completionHandlerForAuth: @escaping (_ success: Bool, _ errorString: String?) -> Void) {
        
        let username = "user"
        //let password = "user"
        
        var userFound = false
        
        if(user == username){
        
            userFound = true
        }
        
        if(userFound){
        
            completionHandlerForAuth(true, nil)
        }
        
    }

}
