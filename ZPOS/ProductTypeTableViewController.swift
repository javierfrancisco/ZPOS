//
//  ProductTypeTableViewController.swift
//  ZPOS
//
//  Created by zenkiu on 5/1/17.
//  Copyright © 2017 zenkiu. All rights reserved.
//

import Foundation

import UIKit
import CoreData


class ProductTypeTableViewController: UITableViewController {
    
    
    var productTypes = [ProductType]()
    var order : Order!
    var user : User!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.title = "Select a Product Category"
        
        getProductTypes()
        
    }
    
    
    
    func getProductTypes(){
        
        print(#function)
        
        let stack =  CoreDataStack.sharedInstance()
        
        // Create a fetchrequest
        let fr = NSFetchRequest<NSFetchRequestResult>(entityName: "Menu")
        
        do {
            if let menuArr = try stack.context.fetch(fr) as? [Menu]{
                
                	
                print("num of Menus found: \(menuArr.count))")
                
                let menu = menuArr[0];
                
                
                print("Menu name: \(String(describing: menu.name)))")
                print("num of product types found: \(String(describing: menu.menuToProductType?.count)))")
                
                productTypes = Array(menu.menuToProductType!) as! [ProductType]
                self.tableView.reloadData()
                
            }
            
            
        } catch {
            print("unable to fetch ProductTypes")
        }
        
    }
    
    
    
    
    // MARK: - UITableViewController
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productTypes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell")!
        let productType = productTypes[indexPath.row]
        cell.textLabel!.text = productType.name
        //cell.detailTextLabel!.text = productType.description
        // let imageName = adventure.credits.imageName
        // cell.imageView!.image = UIImage(named: imageName!)
        
        cell.textLabel!.textColor = UIColor.white
        
        return cell
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Get the selected product Type
         let selectedProductType = productTypes[indexPath.row]
        
        print("num of product SUB types found: \(String(describing: selectedProductType.productTypeToProductSubtype?.count)))")
        
        // Get a ProductSubtypeViewController from the Storyboard
        let productSubtypeController = self.storyboard!.instantiateViewController(withIdentifier: "ProductSubTypeViewController")as! ProductSubTypeViewController
        
        // Set the story node so that we will see the start of the story
        //storyNodeController.storyNode = firstNodeInTheAdventure
        
        productSubtypeController.productSubtypeArr = Array(selectedProductType.productTypeToProductSubtype!) as! [ProductSubtype]
        
        productSubtypeController.order = order
        
        // Push the new controller onto the stack
        self.navigationController!.pushViewController(productSubtypeController, animated: true)
        
    }
    
    
    
    
}
