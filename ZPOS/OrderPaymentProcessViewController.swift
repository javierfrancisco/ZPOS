//
//  OrderProcessViewController.swift
//  ZPOS
//
//  Created by zenkiu on 5/21/17.
//  Copyright © 2017 zenkiu. All rights reserved.
//

import Foundation


import Foundation


import UIKit
import CoreData



class OrderPaymentProcessViewController: UIViewController {
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    var order : Order!

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var amountReceivedTextField: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        print(#function)
        
        self.title = "Order Payment"
        
    }
    @IBOutlet weak var creditCardPaymentSelectedAction: UIButton!
    @IBOutlet weak var cashPaymentSelectedAction: UIButton!

    @IBOutlet weak var cancelPaymentAction: UIButton!
    
    @IBAction func submitPaymentAction(_ sender: Any) {
        
        print(#function)
        
        do {
            try CoreDataStack.sharedInstance().saveContext()
        } catch {
            print("Error while saving.")
        }
        
        
        let controller = storyboard!.instantiateViewController(withIdentifier: "ManagerNavigationController") as! UINavigationController
        
        
        
        present(controller, animated: true, completion: nil)

        
        
        
    }

}

