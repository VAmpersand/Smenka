//
//  TeamShSchCollectionViewDataSourse.swift
//  Smenka
//
//  Created by Viktor on 08.03.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

extension TeamShiftScheduleViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return weekdays.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! CalendarScrollCollectionViewCell
        
            cell.dayLabel.text = "\(indexPath.row + 1)"
       
            let weekdays = getWeekdaysArray(currentMonth: currentMonth, firstWeekDayOfMonth: firstWeekDayOfMonth)
            cell.weekdayLabel.text = weekdays[indexPath.row]

        
        cell.setDesign()
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        tempIndexPath = indexPath
//    }
    
}
