//
//  ShiftTypeTableViewCell.swift
//  Smenka
//
//  Created by Viktor on 09.02.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

class ShiftTypeTableViewCell: UITableViewCell {
    
    @IBOutlet var typeNameLabel: UILabel!
    @IBOutlet var shiftTimeLabel: UILabel!
    @IBOutlet var typeColor: UIImageView!
    
    func setTheme() {
        typeNameLabel.textColor = Style.labelColor
        shiftTimeLabel.textColor = Style.labelColor
        
        self.backgroundColor = Style.backgroundColor
        
        typeColor.layer.cornerRadius = 20
    }
}
