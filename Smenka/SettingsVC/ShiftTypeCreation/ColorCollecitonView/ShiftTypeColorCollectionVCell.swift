//
//  ShiftTypeColorCollectionVC.swift
//  Smenka
//
//  Created by Viktor on 10.02.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

class ShiftTypeColorCollectionVCell: UICollectionViewCell {
  
    @IBOutlet var colorImage: UIImageView!
    @IBOutlet var blurEffect: UIVisualEffectView!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        
        colorImage.layer.cornerRadius = 20
        blurEffect.alpha = 0
        blurEffect.layer.cornerRadius = 20
        blurEffect.clipsToBounds = true
      
    }

}


