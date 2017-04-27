//
//  ZPOSClient.swift
//  ZPOS
//
//  Created by zenkiu on 4/26/17.
//  Copyright © 2017 zenkiu. All rights reserved.
//

import Foundation


class ZPOSClient : NSObject{

    
    // MARK: Shared Instance
    
    class func sharedInstance() -> ZPOSClient {
        struct Singleton {
            static var sharedInstance = ZPOSClient()
        }
        return Singleton.sharedInstance
    }
    
}
