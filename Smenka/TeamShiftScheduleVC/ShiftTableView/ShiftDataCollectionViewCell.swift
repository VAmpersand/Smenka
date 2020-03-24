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
        // Initialization code
        setDesign()
    }
    
    func setDesign() {
        shiftTypeLabel.textColor = Style.labelColor
    }

}
