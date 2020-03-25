//
//  TeamShSchCollectionViewDataSourse.swift
//  Smenka
//
//  Created by Viktor on 08.03.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

extension TeamShiftScheduleViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weekdays.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! CalendarScrollCollectionViewCell
        
        //        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(scrollCalendar))
        //        cell.addGestureRecognizer(panGestureRecognizer)
        cell.setDesign()
        
        cell.dayLabel.text = "\(indexPath.row + 1)"
        
        let weekdays = getWeekdaysArray(currentMonth: currentMonth, firstWeekDayOfMonth: firstWeekDayOfMonth)
        cell.weekdayLabel.text = weekdays[indexPath.row]
        
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//    }
    

    func collectionView(_ collectionView: UICollectionView, targetContentOffsetForProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {

        
        return CGPoint(x: proposedContentOffset.x, y: proposedContentOffset.y)
    }
    
    //    @objc func scrollCalendar(recognizer: UIPanGestureRecognizer) {
    //
    //        if recognizer.state == .began {
    //            print("Gesture began")
    //        } else if recognizer.state == .changed {
    //
    //            let translation = recognizer.translation(in: self.view)
    //
    //        } else if recognizer.state == .ended {
    //
    //        }
    //    }
}
