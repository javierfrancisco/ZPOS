//
//  NewOrderViewController.swift
//  ZPOS
//
//  Created by zenkiu on 4/27/17.
//  Copyright © 2017 zenkiu. All rights reserved.
//

import Foundation


import UIKit
import CoreData


class OrderViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    var productTypes = [ProductType]()
    var productOrder : [ProductOrder]!
    var order : Order!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        print(#function)
        
        if order != nil {
            print("Products in order: \(order.orderToProductOrder!.count)")
        }
        
        
        self.title = "Current Order"
        
    
        getProductTypes()
        
        getOrder()
       
    }
    
    func getOrder(){
    
        
        
        
        if order == nil {
        
            let stack =  CoreDataStack.sharedInstance()
            
            order = Order(context: stack.context)
          
        }
        
        productOrder = Array(order.orderToProductOrder!) as! [ProductOrder]
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Product", style: .plain, target: self, action: #selector(addProduct))
        
        
    }
    
    func addProduct(){
        
        print(#function)
        
        let controller = storyboard!.instantiateViewController(withIdentifier: "ProductTypeTableViewController") as! ProductTypeTableViewController
        
        controller.productTypes = productTypes
        controller.order = order
        
        
        //        controller.movie = movies[(indexPath as NSIndexPath).row]
        navigationController!.pushViewController(controller, animated: true)
    }
    
 
    
    func getProductTypes(){
        
        print(#function)
        
        let stack =  CoreDataStack.sharedInstance()
        
        // Create a fetchrequest
        let fr = NSFetchRequest<NSFetchRequestResult>(entityName: "Menu")
        
        do {
            if let menuArr = try stack.context.fetch(fr) as? [Menu]{
            
                
                 print("num of Menus found: \(menuArr.count))")
                
                if menuArr.count > 0 {
                
                    //if let products = menuArr[0].menuToProduct as NSSet?{
                        
                    //    print("num of Products in Menu found: \(products.count))")
                   // }
                }
            }
            
            
            // Create a fetchrequest
            let fr1 = NSFetchRequest<NSFetchRequestResult>(entityName: "Product")
            
            do {
                if let productArr = try stack.context.fetch(fr1) as? [Product]{
                    
                    
                    print("num of Products found: \(productArr.count))")
                }
            }
            
           
            
            
            
           // showAlbums(albums: albums!)
            
        } catch {
            print("unable to fetch ProductTypes")
        }
        
    }
    
    
    
    
  
    


   
}



// MARK: - FavoritesViewController: UITableViewDelegate, UITableViewDataSource

extension OrderViewController: UITableViewDelegate, UITableViewDataSource {
    
   
    // MARK: - UITableViewController
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("hellll")
        return productOrder.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell")!
        let productOrderC = productOrder[indexPath.row]
        cell.textLabel!.text = String(productOrderC.price)
        //cell.detailTextLabel!.text = productType.description
        // let imageName = adventure.credits.imageName
        // cell.imageView!.image = UIImage(named: imageName!)
        
        return cell
        
    }
    
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Get the selected product Type
        let selectedProductType = productTypes[indexPath.row]
        
        
        
        
        // Get a ProductSubtypeViewController from the Storyboard
        let productSubtypeController = self.storyboard?.instantiateViewController(withIdentifier: "ProductSubTypeViewController") as! ProductSubTypeViewController
        
        // Set the story node so that we will see the start of the story
        //storyNodeController.storyNode = firstNodeInTheAdventure
        
        // Push the new controller onto the stack
        self.navigationController!.pushViewController(productSubtypeController, animated: true)
        
    }
}
