//
//  AppDelegate.swift
//  ZPOS
//
//  Created by zenkiu on 4/23/17.
//  Copyright © 2017 zenkiu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let stack = CoreDataStack(modelName: "Model")!
    
    
    // MARK: Preload Data
    
    func preloadData() {
        
        print("hola")
        print(#function)
        
        // Remove previous stuff (if any)
        do {
            try stack.dropAllData()
        } catch {
            print("Error droping all objects in DB")
        }
        
        //Create a menu
        //Add products to the menu
        //Drinks > Cold > Bubble Tea
        let menu = Menu(name: "BobaSurf", description: "Coffe Shop Menu", context: stack.context)
        
        let productType = ProductType(name: "Drinks", description: "All the drinks", context: stack.context)
       
        let productSubtype = ProductSubtype(name: "Cold", description: "Cold Drinks", context: stack.context)
        
        productType.productTypeToProductSubtype?.adding(productSubtype)
        
        let product = Product(name: "Bubble Tea", description: "Tapioca Tea", context: stack.context)
        
        let productExtra = ProductExtra(name: "Whole Milk", description: "Whole Milk", price: 0.30, context: stack.context)
        
        productExtra.productExtraToProduct = product
        
        let productExtra1 = ProductExtra(name: "Light Milk", description: "Light Milk", price: 0.35, context: stack.context)
        
        productExtra1.productExtraToProduct = product
        
        let productExtra2 = ProductExtra(name: "Soy Milk", description: "Soy Milk", price: 0.40, context: stack.context)
        
        productExtra2.productExtraToProduct = product
        
        let productExtra3 = ProductExtra(name: "Double Tapioca", description: "Tapioca Extra", price: 0.50, context: stack.context)
        
        productExtra3.productExtraToProduct = product
        
        
        product.productToProductExtra?.adding(productExtra)
        product.productToProductExtra?.adding(productExtra1)
        product.productToProductExtra?.adding(productExtra2)
        product.productToProductExtra?.adding(productExtra3)
        product.productToProductSubtype = productSubtype
        productSubtype.productSubtypeToProduct?.adding(product)
        
        productType.addToProductTypeToProductSubtype(productSubtype)
        productType.productTypeToMenu = menu
        menu.menuToProductType?.adding(productType)
        
        let productSizeSmall = ProductSize(name: "Small", price: 3.35, context: stack.context)
        let productSizeMedium = ProductSize(name: "Medium", price: 4.45, context: stack.context)
        let productSizeLarge = ProductSize(name: "Large", price: 5.55, context: stack.context)
        
        product.addToProductToProductSize(productSizeSmall)
        product.addToProductToProductSize(productSizeMedium)
        product.addToProductToProductSize(productSizeLarge)
        
        ////////
        //CheeseCake
        //Desserts > Sweet and Cold > CheeseCake
        
        let productTypeD = ProductType(name: "Desserts", description: "All the desserts", context: stack.context)
        
        let productSubtypeD = ProductSubtype(name: "Sweet and Cold", description: "Cold Desserts", context: stack.context)
        
        productTypeD.productTypeToProductSubtype?.adding(productSubtypeD)
        
         let productCheeseCake = Product(name: "Cheese Cake", description: "Delicious Cheese cake", context: stack.context)
        
        productSubtypeD.productSubtypeToProduct?.adding(productCheeseCake)
        
        productTypeD.productTypeToMenu = menu
        menu.menuToProductType?.adding(productTypeD)
        
        print(menu)
        
        do{
            try stack.saveContext()
        }catch{
            print("Error while saving the context")
        }
       
    }

    


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        print(#function)
        preloadData()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

