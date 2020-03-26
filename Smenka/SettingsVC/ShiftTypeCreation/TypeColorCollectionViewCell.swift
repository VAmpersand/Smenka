//
//  TypeColorCollectionViewCell.swift
//  Smenka
//
//  Created by Viktor on 26.03.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

class TypeColorCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var colorView: UIView!
    @IBOutlet var blurEffect: UIVisualEffectView!
    
    func setDesign() {
        
        colorView.layer.cornerRadius = 20
        blurEffect.alpha = 0
        blurEffect.layer.cornerRadius = 20
        blurEffect.clipsToBounds = true
    }
    
}
