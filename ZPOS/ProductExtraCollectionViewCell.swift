//
//  File.swift
//  ZPOS
//
//  Created by zenkiu on 5/16/17.
//  Copyright © 2017 zenkiu. All rights reserved.
//

import Foundation
import UIKit

class ProductExtraCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    //@IBOutlet weak var schemeLabel: UILabel!
    
    
    
    func initCell(){
        
        print("in initCell")
        //show the activity indicator
        //  locationImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        cellImageView.backgroundColor = UIColor.lightGray
        cellImageView.layer.cornerRadius = 8.0
        cellImageView.clipsToBounds = true
        cellImageView.image = nil
    }
    
    func selected(){
        
        cellImageView.backgroundColor = UIColor.green
    }

    func unselected(){
        
        cellImageView.backgroundColor = UIColor.lightGray
    }
}
