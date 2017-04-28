//
//  ManagerNavigationController.swift
//  ZPOS
//
//  Created by zenkiu on 4/27/17.
//  Copyright © 2017 zenkiu. All rights reserved.
//

import Foundation


import UIKit

class TodaysOrdersController: UIViewController {

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        print(#function)
        
        // create and set the logout button
        parent!.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logout))
        
        parent!.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "New Order", style: .plain, target: self, action: #selector(createNewOrder))

    }

    
    func logout(){
    
        print(#function)
    }
    
    
    func createNewOrder(){
        
        print(#function)
        
        let controller = storyboard!.instantiateViewController(withIdentifier: "NewOrderViewController") as! NewOrderViewController
//        controller.movie = movies[(indexPath as NSIndexPath).row]
        navigationController!.pushViewController(controller, animated: true)
    }
}
