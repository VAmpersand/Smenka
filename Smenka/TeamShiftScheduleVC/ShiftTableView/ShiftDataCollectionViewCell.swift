//
//  ShiftDataCollectionViewCell.swift
//  Smenka
//
//  Created by Viktor on 09.03.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

class ShiftDataCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var shiftTypeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setDesign()
    }
    
    func setDesign() {
        backgroundColor = .clear

        shiftTypeLabel.textColor = Style.labelColor
        shiftTypeLabel.backgroundColor = Style.barBackgroundColor
        shiftTypeLabel.layer.cornerRadius = 3
        shiftTypeLabel.clipsToBounds = true
        
        

    }

}
