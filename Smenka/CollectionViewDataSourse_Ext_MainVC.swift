//
//  CollectionViewDataSourse_Ext_MainVC.swift
//  Smenka
//
//  Created by Viktor on 29.01.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbersOfDaysInMonth[currentMonthIndex - 1] + firstWeekDayOfMonth - 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Calendar", for: indexPath) as! DateCollectionViewCell
        
        var calcDate = 0
        
        cell.dateLabel.textColor = .black
        cell.layer.cornerRadius = cell.bounds.width / 2 
        cell.shiftColorView.isHidden = true
        
        
        if indexPath.item <= firstWeekDayOfMonth - 2 {
            cell.isHidden = true
        } else {
            calcDate = indexPath.row - firstWeekDayOfMonth + 2
            cell.isHidden = false
            cell.dateLabel.text = "\(calcDate)"
        }
        
        //  Mark today in red circle
        if calcDate == todaysDate && currentYear == presentYear && currentMonthIndex == presentMonthIndex {
            //                cell.isUserInteractionEnabled = false
            //                cell.dateLabel.textColor = UIColor.blue
            cell.shiftColorView.isHidden = false
            cell.drowCircleForToday()
            
        }
        
        //  Add weekend. Mark weekend in grey
        switch indexPath.row {
        case 5, 6, 12, 13, 19, 20, 26, 27, 33, 34:
            if Int(cell.dateLabel.text!)! > 0 {
                cell.dateLabel.textColor = UIColor.lightGray
            }
        default:
            break
        }
        
        //  Filling/display the calendar with shifts from the schedule
        guard let schedulesShifts = schedulesShifts else { return cell }
        for scheduleShift in schedulesShifts {
            if scheduleShift.monthlyScheduleName == "\(currentYear)-\(currentMonthIndex)" {
                cell.backgroundColor = testColors[scheduleShift.shifts[indexPath.row].shiftTypeIndex]
            } else {
                cell.backgroundColor = testColors[0]
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! DateCollectionViewCell
        
        var shift = Shift()
        let newShift = Shift()
        
        guard let schedulesShifts = schedulesShifts else { return }
              for scheduleShift in schedulesShifts {
                  if scheduleShift.monthlyScheduleName == "\(currentYear)-\(currentMonthIndex)" {
                    shift = scheduleShift.shifts[indexPath.row]
                  }
              }
        
        
        if editButtonPressCheck {
            
            newShift.shiftTypeIndex = shift.shiftTypeIndex
            
            newShift.shiftTypeIndex += 1
            if newShift.shiftTypeIndex == testColors.count {
                newShift.shiftTypeIndex = 0
            }

            DispatchQueue.main.async {
                StorageManager.editShift(shift, newShift)
                cell.backgroundColor = testColors[newShift.shiftTypeIndex]
            }
            
            //        let lbl = cell?.subviews[1] as! UILabel
            //        lbl.textColor = UIColor.white
        }
    }
    
    
    func didChangeMonth(monthIndex: Int, year: Int) {
        currentMonthIndex = monthIndex + 1
        currentYear = year
        
        //for leap year, make february month of 29 days
        if monthIndex == 1 {
            if currentYear % 4 == 0 {
                numbersOfDaysInMonth[monthIndex] = 29
            } else {
                numbersOfDaysInMonth[monthIndex] = 28
            }
        }
        
        firstWeekDayOfMonth = getIndexFirstWeekDay(currentYear: currentYear, currentMonthIndex: currentMonthIndex)
    }
}


//            if calcDate < todaysDate && currentYear == presentYear && currentMonthIndex == presentMonthIndex {
      //                cell.isUserInteractionEnabled = false
      //                cell.dateLabel.textColor = UIColor.lightGray
      //            } else {
      //                cell.isUserInteractionEnabled = true
      //                //                                 cell.dateLabel.textColor = Style.activeCellLblColor
      //            }
