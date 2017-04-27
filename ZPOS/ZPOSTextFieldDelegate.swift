//
//  ZPOSTextFieldDelegate.swift
//  ZPOS
//
//  Created by zenkiu on 4/26/17.
//  Copyright © 2017 zenkiu. All rights reserved.
//

import Foundation


import Foundation
import UIKit


class ZPOSTextFieldDelegate: NSObject,  UITextFieldDelegate, UINavigationControllerDelegate {
    
    var currentEditingTextField=0
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        print("In: textFieldDidBeginEditing")
        
        
        if textField.text == "Username"{
            
            textField.text = ""
        }
        
        if textField.text == "Password"{
            
            textField.text = ""
            textField.isSecureTextEntry = true
        }
        
        currentEditingTextField=textField.tag
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        print("In: textFieldShouldReturn")
        
        return true;
    }
    
}
