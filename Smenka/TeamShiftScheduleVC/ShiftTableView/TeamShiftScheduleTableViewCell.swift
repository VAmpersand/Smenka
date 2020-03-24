//
//  TeamShiftScheduleTableViewCell.swift
//  Smenka
//
//  Created by Viktor on 11.03.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

class TeamShiftScheduleTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var staffLabel: UILabel!
    @IBOutlet var shiftCollectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "shiftTypeCell", for: indexPath) as! ShiftDataCollectionViewCell
        
        cell.shiftTypeLabel.text = "\(indexPath.row)"
        
        cell.backgroundColor = .red
      
        return cell
    }
    
    
}
