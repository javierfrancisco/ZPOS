//
//  ManagerNavigationController.swift
//  ZPOS
//
//  Created by zenkiu on 4/27/17.
//  Copyright © 2017 zenkiu. All rights reserved.
//

import Foundation


import UIKit
import CoreData

class TodaysOrdersController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var user : User!
    
    var orders : [Order]!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        print(#function)
        
        
        
        // create and set the logout button
        parent!.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logout))
        
        parent!.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "New Order", style: .plain, target: self, action: #selector(createNewOrder))

        self.title = "Today's Orders"
        
        getOrders()
    }

    
    func logout(){
    
        print(#function)
    }
    
    
    func createNewOrder(){
        
        print(#function)
        
        let controller = storyboard!.instantiateViewController(withIdentifier: "OrderViewController") as! OrderViewController
        
        controller.user = user


        navigationController!.pushViewController(controller, animated: true)
    }
    
    
    func getOrders(){
        
        print(#function)
        
        if orders == nil {
        
            orders = [Order]()
        }
        
        let stack =  CoreDataStack.sharedInstance()
        
        // Create a fetchrequest
        let fr = NSFetchRequest<NSFetchRequestResult>(entityName: "Order")
        
        do {
            let ordersArr = try stack.context.fetch(fr) as? [Order]
            
            print("num of orders found: \(ordersArr?.count)")
            
            
            orders = ordersArr
            tableView.reloadData()
            //showAlbums(albums: albums!)
            
        } catch {
            print("unable to fetch orders")
        }
        
    }
}


// MARK: - TodaysOrdersController: UITableViewDelegate, UITableViewDataSource

extension TodaysOrdersController: UITableViewDelegate, UITableViewDataSource {
    
    
    // MARK: - UITableViewController
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        

        print("orders count: \(orders.count)")
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell") as! OrderTableViewCell
        
        
        let order = orders[indexPath.row]
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm a"
        formatter.amSymbol = "am"
        formatter.pmSymbol = "pm"
        
        let time = formatter.string(from: order.createDate! as Date)
        
        //cell.detailTextLabel!.text = String(order.orderToProductOrder!.count)
        
        cell.textLabel?.text = String(indexPath.row + 1) + ". " + String(order.orderToProductOrder!.count) + " Products "
     
        
        cell.priceLabel.text = "$" + String(order.total)
        cell.timeLabel.text = time
        
        
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
}


