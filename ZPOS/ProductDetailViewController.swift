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


    @IBOutlet weak var collectionFlowLayout: UICollectionViewFlowLayout!
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
    var productExtrasSelected = [ProductExtra]()
    var price : Double!
    var productSizeSelected : ProductSize!
    var unitPrice = 0
    
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
     
        parent!.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addProduct))

   
        initProductSizes(product)
        initProductExtras(product)
        calculatePrice()
        }
    

  
    @IBOutlet weak var productPriceLabel: UILabel!
    
    func calculatePrice(){
    
        //Calculates the total price and updates the total label
        
        //Ttotal price = Size.price + (extras.price) x quantity
        let productSizeAmount =  productSizeSelected.price
        //Get extras:
        
        var extrasAmount = Double(0)
        
        for productExtra in productExtrasSelected{
        
            extrasAmount += productExtra.price
        }
        
        
        let productPrice = (productSizeAmount + extrasAmount) * Double(productQuantity);
        
        
        productPriceLabel.text = String(productPrice)
    }
    @IBOutlet weak var tempView: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func initProductExtras(_ product : Product){
        
        
        print(#function)
        
        print("extras count \(String(describing: product.productToProductExtra?.count))")
        
        productExtras = Array(product.productToProductExtra!) as! [ProductExtra]
        
        
        
        let space: CGFloat = 0.0
        
        let dimension =  (self.collectionView.frame.size.width - (2 * space)) / 3.0
        
        collectionFlowLayout.minimumInteritemSpacing = space
        collectionFlowLayout.minimumLineSpacing = space
        collectionFlowLayout.itemSize = CGSize(width: dimension, height: dimension)
        
    }
    
    func initProductSizes(_ product : Product){
        

        createProductSizeButtons(product)
    
        

        //Configure the slide bar
        let minimumValue = Float(0)
        let maximumValue = Float(productSizeButtonArray.count - 1)
        let defaultValue = (maximumValue - minimumValue) / 2
        
        sizeSlider.maximumValue = minimumValue
        sizeSlider.maximumValue = maximumValue
        sizeSlider.value = defaultValue
        sizeSlider.minimumTrackTintColor = UIColor.green
        sizeSlider.maximumTrackTintColor = UIColor.darkGray
        sizeSlider.thumbTintColor = UIColor.white
        
        selectProductSize(selectedValue: sizeSlider.value)
        
        
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
    
    func selectProductSize(selectedValue : Float){
        
        
        let value = Int(selectedValue)
        
        print("values: \(selectedValue) :and: \(value)")

        let selectedButton = productSizeButtonArray[value]
       
        print(#function)
        
        if productSizeSelected == nil {
            
            //init the size selected
            productSizeSelected = getProductSizeByText(size: (selectedButton.titleLabel?.text)!)
            
        }else{
            
            print("size changed")
            
            let currentButton = getProductSizeButtonByText(size: productSizeSelected.name!)
            
            if selectedButton.titleLabel != currentButton?.titleLabel {
            
                currentButton?.setTitleColor(UIColor.white, for: .normal)
                productSizeSelected = getProductSizeByText(size: (selectedButton.titleLabel?.text)!)
                
                calculatePrice()
            }
        }

        selectedButton.setTitleColor(UIColor.green, for: .normal)
        selectedButton.reloadInputViews()
       
    }
    
    func getProductSizeByText( size : String) -> ProductSize?{

        let productSizes = product.productToProductSize as! Set<ProductSize>
        
        for productSize in productSizes {
            
            if size.contains(productSize.name!){
                return productSize
            }
        }
        return nil
    }
    
    func getProductSizeButtonByText( size : String) -> UIButton?{
       
        for productSizeButton in productSizeButtonArray {
            
            if (productSizeButton.titleLabel?.text?.contains(size))!{
                return productSizeButton
            }
        }
        return nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        print(#function)
        
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
            
            let productSizeLabel = productSize.name! + " \n $" + String(productSize.price)

            
            productSizeButtonArray += [createButton(
                withColor: UIColor.black,
                title: productSizeLabel)
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
        
        calculatePrice()
        
    }
    @IBAction func quantityAddAction(_ sender: Any) {
        
        productQuantity += 1
        
         quantityLabel.text = String(productQuantity)
        calculatePrice()
    }
    @IBAction func addProductToOrder(_ sender: Any) {
        
        print(#function)
        
        let stack = CoreDataStack.sharedInstance()
        let productPrice = Double(productPriceLabel.text!)
        
        let unitPrice = productPrice! / Double(productQuantity)
        
        let productOrder = ProductOrder(unitPrice: unitPrice, size: productSizeSelected!.name! , quantity: productQuantity, total: productPrice!, context: stack.context)
        
        productOrder.productOrderToProduct = product
    
        productOrder.productOrderToOrder = order
       
        order.total = order.total + productPrice!
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
        
        selectProductSize(selectedValue: sender.value)
        
    }
}




extension ProductDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource  {
    

    
    // MARK: Collection View Data Source
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.productExtras.count
    }
  
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(#function)
        
        if let cell = collectionView.cellForItem(at: indexPath) as? ProductExtraCollectionViewCell {
        
            let productExtraSelected = productExtras[indexPath.row]
            
            if productExtrasSelected.contains(productExtraSelected){
                
                if let index = productExtrasSelected.index(of:productExtraSelected) {
                    productExtrasSelected.remove(at: index)
                    
                    print("unselected")
                    cell.unselected()
                }
                
            }else{
                print("selected")
                productExtrasSelected.append(productExtraSelected)
                cell.selected()
            }
            //productExtrasSelected
        }
        
        calculatePrice()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductExtraCollectionViewCell", for: indexPath) as! ProductExtraCollectionViewCell
        
        cell.initCell()
        
        let productExtra = self.productExtras[indexPath.row]
        
        print("name: \(String(describing: productExtra.name))")
        // Set the name and image
        cell.nameLabel.text = productExtra.name
        //  cell.villainImageView?.image = UIImage(named: villain.imageName)
        //cell.schemeLabel.text = "Scheme: \(villain.evilScheme)"
        
        return cell
    }
    
    
   
    
}

