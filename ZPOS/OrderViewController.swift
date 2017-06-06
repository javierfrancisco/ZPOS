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
    

    @IBOutlet weak var productsCountLabel: UILabel!
    
    @IBOutlet weak var totalAmountLabel: UILabel!
    var productTypes = [ProductType]()
    var productOrder : [ProductOrder]!
    var order : Order!
    var user : User!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        print(#function)
        
        if order != nil {
            print("Products in order: \(order.orderToProductOrder!.count)")
        }
        
        
        self.title = "Current Order"
        
    
        getProductTypes()
        
        getOrder()
        
        if order.orderToProductOrder?.count == 0 {
        
            payButton.isEnabled = false
        }else{
            payButton.isEnabled = true
        }
        
        
        
    
       
    }

    func getOrder(){
    
        
        
        
        if order == nil {
        
            let stack =  CoreDataStack.sharedInstance()
            
            order = Order(user: ZPOSClient.sharedInstance().user!, context: stack.context)
           
        }
        
        productOrder = Array(order.orderToProductOrder!) as! [ProductOrder]
        
        var productsCount : Int = 0
        for productOrder: ProductOrder in productOrder {
            
            productsCount = productsCount +  Int(productOrder.quantity)
        }
        
        productsCountLabel.text = String(productsCount)
        
        totalAmountLabel.text = String(order.total)
        
        
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
    
    @IBOutlet weak var payButton: UIButton!
    
    @IBAction func cancelOrderAction(_ sender: Any) {
    }
    

    @IBAction func goToOrderPaymentProcessAction(_ sender: Any) {
        
        
        // Get a ProductSubtypeViewController from the Storyboard
        let orderPaymentProcessViewController = self.storyboard?.instantiateViewController(withIdentifier: "OrderPaymentProcessViewController") as! OrderPaymentProcessViewController
        
        // Set the story node so that we will see the start of the story
        orderPaymentProcessViewController.order = order
        
        // Push the new controller onto the stack
        self.navigationController!.pushViewController(orderPaymentProcessViewController, animated: true)

        
    }

   
}



// MARK: - OrderViewController: UITableViewDelegate, UITableViewDataSource

extension OrderViewController: UITableViewDelegate, UITableViewDataSource {
    
   
    // MARK: - UITableViewController
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("hellll")
        return productOrder.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ProductOrderTableViewCell") as! ProductOrderTableViewCell
        
        
        let productOrderC = productOrder[indexPath.row]
        
        cell.priceLabel.text = String(productOrderC.total)
        
        let productDescription = String(productOrderC.quantity) + " " + productOrderC.productSize! + " " + productOrderC.productOrderToProduct!.name!
        
        //cell.textLabel!.text = String(productOrderC.price)
        cell.textLabel!.text = productDescription
        
        //cell.detailTextLabel!.text = productType.description
        // let imageName = adventure.credits.imageName
        // cell.imageView!.image = UIImage(named: imageName!)
        
        return cell
        
    }
    
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
                
    }
}
