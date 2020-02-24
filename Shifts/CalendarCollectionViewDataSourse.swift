//
//  CalendarCollectionViewDataSourse.swift
//  Shifts
//
//  Created by Viktor on 21.02.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

extension TodayViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sharedDate.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CalendarCollectionViewCell
        
        cell.layer.cornerRadius = cell.bounds.width / 2
        cell.cellView.isHidden = true
        
        // Hide empty cell's
        if sharedDate[indexPath.row] == 0 {
            cell.isHidden = true
        }
        
        cell.cellLabel.text = "\(sharedDate[indexPath.row])"
        
        if !colorIndexes.isEmpty {
            cell.backgroundColor = colors[colorIndexes[indexPath.row]]
        }
        
        //MARK:   Mark today in circle
        if sharedDate[indexPath.row] == currentDay {
            cell.cellView.isHidden = false
        }
        
        setColorInDateLableText(cell: cell, indexPath: indexPath)
        
        return cell
    }
    
    //MARK:  Set text color in dateLabel in cell
    func setColorInDateLableText(cell: UICollectionViewCell, indexPath: IndexPath) {
        let cell = cell  as! CalendarCollectionViewCell
        if  colorIndexes[indexPath.row] != 18 {
            cell.cellLabel.textColor = .white
            cell.drowCircleForToday(color: .white)
        } else {
            
            //  Add weekend. Mark weekend in grey
            switch indexPath.row {
            case 5, 6, 12, 13, 19, 20, 26, 27, 33, 34:
                cell.cellLabel.textColor = .white
            default:
                cell.cellLabel.textColor = .black
            }
            cell.drowCircleForToday(color: .red)
        }
    }
}
