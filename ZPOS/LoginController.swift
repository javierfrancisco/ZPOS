//
//  ViewController.swift
//  ZPOS
//
//  Created by zenkiu on 4/23/17.
//  Copyright © 2017 zenkiu. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    let zposTextFieldDelegate = ZPOSTextFieldDelegate()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 5
        
        prepareTextField(textField: username, defaultText: "Username")
        prepareTextField(textField: password, defaultText: "Password")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginPressed(_ sender: Any) {
        

        print(#function)
        
    }
    
    
    func prepareTextField(textField: UITextField, defaultText: String) {
        //print("IN-->prepareTextField")
       
        textField.delegate = zposTextFieldDelegate
        textField.text=defaultText
        
    }

}

