//
//  ProductSubtypeViewController.swift
//  ZPOS
//
//  Created by zenkiu on 5/1/17.
//  Copyright © 2017 zenkiu. All rights reserved.
//


import Foundation

import UIKit
import CoreData


class ProductSubTypeViewController: UITableViewController {
    
    
    var productSubtypeArr : [ProductSubtype]!
    var order : Order!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.title = "Select a Product Subcategory"
        
        print(" viewDidLoad num of sub types found: \(productSubtypeArr.count))")
        //getProductSubtype()
        
    }
    
    
    
    func getProductSubtype(){
        
        print(#function)
        
        let stack =  CoreDataStack.sharedInstance()
        
        // Create a fetchrequest
        let fr = NSFetchRequest<NSFetchRequestResult>(entityName: "Menu")
        
        do {
            if let menuArr = try stack.context.fetch(fr) as? [Menu]{
                
                
                print("num of Menus found: \(menuArr.count))")
                
                if menuArr.count > 0 {
                    
                   // if let products = menuArr[0].menuToProduct as NSSet?{
                        
                   //     print("num of Products in Menu found: \(products.count))")
                    //}
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
    
    
    
    
    // MARK: - UITableViewController
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productSubtypeArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "SubTypeCell")!
        let productSubType = productSubtypeArr[indexPath.row]
        cell.textLabel!.text = productSubType.name
        cell.textLabel!.textColor = UIColor.white
        
       // cell.detailTextLabel!.text = productSubType.description
        // let imageName = adventure.credits.imageName
        // cell.imageView!.image = UIImage(named: imageName!)
        
        return cell
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Get the selected product Type
        let selectedProductSubType = productSubtypeArr[indexPath.row]
        
         print("num of Products found*: \(String(describing: selectedProductSubType.productSubtypeToProduct?.count)))")
        
        // Get a ProductSubtypeViewController from the Storyboard
        let productListViewController = self.storyboard!.instantiateViewController(withIdentifier: "ProductListViewController")as! ProductListViewController

        
        // Set the story node so that we will see the start of the story
        //storyNodeController.storyNode = firstNodeInTheAdventure
        productListViewController.productArr  = Array(selectedProductSubType.productSubtypeToProduct!) as! [Product]
        
        productListViewController.order = order
        
        
        // Push the new controller onto the stack
        self.navigationController!.pushViewController(productListViewController, animated: true)
        
    }
    
    
    
    
}
