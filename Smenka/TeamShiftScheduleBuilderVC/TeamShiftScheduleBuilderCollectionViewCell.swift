//
//  TeamShiftScheduleBuilderCollectionViewCell.swift
//  Smenka
//
//  Created by Viktor on 27.03.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

class TeamShiftScheduleBuilderCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var cellLabel: UILabel!
        
    func setDesign() {
        backgroundColor = .clear

        cellLabel.textColor = Style.labelColor
        cellLabel.layer.cornerRadius = 3
        cellLabel.clipsToBounds = true
        cellLabel.layer.borderColor = (Style.teamScheduleBorderColor).cgColor
        cellLabel.layer.borderWidth = 1

    }
}
