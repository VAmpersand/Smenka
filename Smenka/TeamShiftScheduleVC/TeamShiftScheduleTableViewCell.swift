//
//  TeamShiftScheduleTableViewCell.swift
//  Smenka
//
//  Created by Viktor on 11.03.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

class TeamShiftScheduleTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var staffLabel: UILabel!
    @IBOutlet weak var shiftCollectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
