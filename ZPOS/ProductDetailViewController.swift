//
//  ProductDetailViewController.swift
//  ZPOS
//
//  Created by zenkiu on 5/11/17.
//  Copyright © 2017 zenkiu. All rights reserved.
//

import Foundation


import UIKit
import CoreData


class ProductDetailViewController: UIViewController {


    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var substractQuantityButton: UIButton!
    @IBOutlet weak var addQuantityButton: UIButton!
    @IBOutlet weak var productDetailForm: UIView!
    

    
    @IBOutlet weak var addProductButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!

    
    @IBOutlet weak var sizeSlider: UISlider!
    
    var product : Product!
    var order : Order!
    var productExtras : [ProductExtra]!
    
    @IBOutlet weak var productSizeStack: UIStackView!
    var productSizeButtonArray = [UIButton]()
    
    var productQuantity = 1
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        substractQuantityButton.layer.cornerRadius = 5
        addQuantityButton.layer.cornerRadius = 5
        addProductButton.layer.cornerRadius = 5
        cancelButton.layer.cornerRadius = 5
        
        self.title = "Customize Product"
        
        quantityLabel.text = String(productQuantity)
        
       // print("in ProductDetailViewController:  \(product.productToProductSize?.count)")
        
        
        parent!.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addProduct))
        
        //let screenSize: CGRect = UIScreen.main.bounds
        
        
     
        //productDetailForm.frame.size.width = 500
   
        initProductSizes(product)
        initProductExtras(product)

        
        }
    @IBOutlet weak var tempView: UIView!
    
    
    func initProductExtras(_ product : Product){
        
        
        print(#function)
        
        print("extras count \(String(describing: product.productToProductExtra?.count))")
        
        productExtras = Array(product.productToProductExtra!) as! [ProductExtra]
        
    }
    
    func initProductSizes(_ product : Product){
        
        
        createProductSizeButtons(product)
    
        for value in productSizeButtonArray{
          productSizeStack.addArrangedSubview(value)
        }
        
        //productSizeStack.insertArrangedSubview(productSizeButtonArray, at: 0)
        productSizeStack.axis = .horizontal
        productSizeStack.distribution = .fillEqually
        productSizeStack.alignment = .fill
        productSizeStack.spacing = 5
        productSizeStack.translatesAutoresizingMaskIntoConstraints = false
        productSizeStack.reloadInputViews()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        print(#function)
        
        sizeSlider.maximumValue = 1
        sizeSlider.maximumValue = 3
        
        sizeSlider.minimumTrackTintColor = UIColor.blue
        
        sizeSlider.maximumTrackTintColor = UIColor.red
        
        sizeSlider.thumbTintColor = UIColor.yellow
       // print("size: \(productDetailForm.frame.width)")
        
        //productDetailForm.frame.size.width = 500
    }
    
    func setTheProductSizes(){
    
       
    }
    
    func addProduct(){
        
        print(#function)
        
        
    }
    
    func createProductSizeButtons(_ product : Product){
        //generate an array of buttons
        let productSizes = product.productToProductSize as! Set<ProductSize>
        
        
        //Sort the product sizes by price
        let productSizesArr = productSizes.sorted(by: { $0.price < $1.price })
        
        for productSize in productSizesArr{
            
            productSizeButtonArray += [createButton(
                withColor: UIColor.brown,
                title: productSize.name!)
            ]
            
        }
        
        
    }
    
    func createButton(
        withColor color:UIColor,
        title:String) -> UIButton
    {
        let newButton = UIButton(type: .system)
        newButton.backgroundColor = color
        newButton.setTitle(title, for: .normal)
        newButton.setTitleColor(UIColor.white, for: .normal)
        return newButton
    }
  
    @IBAction func quantitySubstractAction(_ sender: Any) {
        
         productQuantity -= 1
        
        //The quantity minimum value is 1
          if productQuantity < 1 {
            productQuantity = 1
         }
        
         quantityLabel.text = String(productQuantity)
        
    }
    @IBAction func quantityAddAction(_ sender: Any) {
        
        productQuantity += 1
        
         quantityLabel.text = String(productQuantity)
    }
    @IBAction func addProductToOrder(_ sender: Any) {
        
        print(#function)
        
        let stack = CoreDataStack.sharedInstance()
        
        let productOrder = ProductOrder(price: 3.2, size: "Small", quantity: productQuantity, total: 5.50, context: stack.context)
        
        productOrder.productOrderToProduct = product
    
        productOrder.productOrderToOrder = order
       
        order.orderToProductOrder?.adding(productOrder)
       
       
        do {
            try CoreDataStack.sharedInstance().saveContext()
        } catch {
            print("Error while saving.")
        }
        
        
        //Send to the Order View
        
        // Get a ProductSubtypeViewController from the Storyboard
        let orderViewController = self.storyboard!.instantiateViewController(withIdentifier: "OrderViewController")as! OrderViewController
        
        orderViewController.order = order
        
        //productDetailViewController.product = selectedProduct
        
        // Push the new controller onto the stack
        self.navigationController!.pushViewController(orderViewController, animated: true)
        

        
    }
    
    @IBAction func doSomething(_ sender : UISlider) {
        
        print(#function)
        
        print("value:\(sender.value)")
        
    }
}




extension ProductDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource  {
    

    
    // MARK: Collection View Data Source
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.productExtras.count
    }
  
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(#function)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductExtraCollectionViewCell", for: indexPath) as! ProductExtraCollectionViewCell
        let productExtra = self.productExtras[indexPath.row]
        
        print("name: \(String(describing: productExtra.name))")
        // Set the name and image
        cell.nameLabel.text = productExtra.name
        //  cell.villainImageView?.image = UIImage(named: villain.imageName)
        //cell.schemeLabel.text = "Scheme: \(villain.evilScheme)"
        
        return cell
    }
    
    
   
    
}

