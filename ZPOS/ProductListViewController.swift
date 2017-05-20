//
//  ProductListViewController.swift
//  ZPOS
//
//  Created by zenkiu on 5/10/17.
//  Copyright © 2017 zenkiu. All rights reserved.
//

import Foundation



import UIKit
import CoreData


class ProductListViewController: UITableViewController {
    
    
    var productArr : [Product]!
    var order : Order!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.title = "Select a Product"
        
        print(" viewDidLoad num of sub types found: \(productArr.count))")
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
        return productArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ProductCell")!
        let productSubType = productArr[indexPath.row]
        cell.textLabel!.text = productSubType.name
        cell.textLabel!.textColor = UIColor.white
        // cell.detailTextLabel!.text = productSubType.description
        // let imageName = adventure.credits.imageName
        // cell.imageView!.image = UIImage(named: imageName!)
        
        return cell
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Get the selected product Type
        let selectedProduct = productArr[indexPath.row]
        
        // Get a ProductSubtypeViewController from the Storyboard
        let productDetailViewController = self.storyboard!.instantiateViewController(withIdentifier: "ProductDetailViewController")as! ProductDetailViewController

        productDetailViewController.order = order
        productDetailViewController.product = selectedProduct
        
        // Push the new controller onto the stack
        self.navigationController!.pushViewController(productDetailViewController, animated: true)
        
    }
    
    
    
    
}
