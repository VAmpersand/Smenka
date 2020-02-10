//
//  ShiftTypeColorCollectionVC.swift
//  Smenka
//
//  Created by Viktor on 10.02.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

class ShiftTypeColorCollectionVCell: UICollectionViewCell {
    
    @IBOutlet weak var colorImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        colorImage.layer.cornerRadius = 20
        
    }

}
