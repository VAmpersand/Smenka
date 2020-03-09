//
//  CalendarScrollCollectionViewCell.swift
//  Smenka
//
//  Created by Viktor on 09.03.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

class CalendarScrollCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weekdayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setDesign()
    }

    func setDesign() {
        dayLabel.textColor = Style.labelColor
        dayLabel.backgroundColor = Style.barBackgroundColor
        dayLabel.layer.cornerRadius = 3
        dayLabel.clipsToBounds = true
        
        weekdayLabel.textColor = Style.labelColor
        weekdayLabel.backgroundColor = Style.barBackgroundColor
        weekdayLabel.layer.cornerRadius = 3
        weekdayLabel.clipsToBounds = true
    }
}
