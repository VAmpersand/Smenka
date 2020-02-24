//
//  CollectionViewDataSource.swift
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
        var shift = Shift()
        
        cell.layer.cornerRadius = cell.bounds.width / 2
        cell.backgroundColor = colors.last
        cell.shiftView.isHidden = true
        
        //MARK:  Get data from database, for current display text color
        guard let schedulesShifts = schedulesShifts else { return cell }
        for scheduleShift in schedulesShifts {
            if scheduleShift.monthlyScheduleName == "\(currentYear)-\(currentMonthIndex)" {
                shift = scheduleShift.shifts[indexPath.row]
            }
        }
        
        //MARK:  Hide empty cell's
        if indexPath.item <= firstWeekDayOfMonth - 2 {
            cell.isHidden = true
        } else {
            calcDate = indexPath.row - firstWeekDayOfMonth + 2
            cell.isHidden = false
            cell.dateLabel.text = "\(calcDate)"
        }
        
        //MARK:   Filling/display the calendar with shifts color from the schedule
        guard let shiftTipes = shiftTypes else { return cell }
        for scheduleShift in schedulesShifts {
            if scheduleShift.monthlyScheduleName == "\(currentYear)-\(currentMonthIndex)" {
                let shift = scheduleShift.shifts[indexPath.row]
                let shiftTypeIndex = shift.shiftTypeIndex
                
                // Сondition for checking the number of types array. Does not allow type deletion error
                if shift.shiftTypeIndex >= shiftTipes.count {
                    let newShift = Shift()
                    newShift.shiftTypeIndex = 0
                    
                    DispatchQueue.main.async {
                        StorageManager.editShift(shift, newShift)
                        cell.backgroundColor = colors[shiftTipes[newShift.shiftTypeIndex].shiftColorIndex]
                        self.setColorInDateLableText(cell: cell, indexPath: indexPath, shift: newShift)
                    }
                } else {
                    cell.backgroundColor = colors[shiftTipes[shiftTypeIndex].shiftColorIndex]
                }
            }
        }
        
        //MARK: Data preparation for the current month only
        if currentYear == presentYear && currentMonthIndex == presentMonthIndex {
            if shiftTipes.isEmpty {
                 colorIndexes[indexPath.row] = 0
            } else {
                colorIndexes[indexPath.row] = shiftTypes[shift.shiftTypeIndex].shiftColorIndex
            }
            sharedDate[indexPath.row] = calcDate
        }
        
        // Set text color in dateLabel in cell
        setColorInDateLableText(cell: cell, indexPath: indexPath, shift: shift)
        
        //MARK:   Mark today in circle
        if calcDate == todaysDate && currentYear == presentYear && currentMonthIndex == presentMonthIndex {
            cell.shiftView.isHidden = false
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
        
        //MARK: Change shift type index
        if editButtonPressCheck {
            
            guard let shiftTipes = shiftTypes else { return }
            newShift.shiftTypeIndex = shift.shiftTypeIndex
            
            // Сondition for checking the number of types array. Вoes not allow type deletion error
            if newShift.shiftTypeIndex >= shiftTipes.count {
                newShift.shiftTypeIndex = 0
            } else {
                newShift.shiftTypeIndex += 1
                if newShift.shiftTypeIndex == shiftTipes.count {
                    newShift.shiftTypeIndex = 0
                }
            }
            
            DispatchQueue.main.async {
                StorageManager.editShift(shift, newShift)
                cell.backgroundColor = colors[shiftTipes[newShift.shiftTypeIndex].shiftColorIndex]
                self.setColorInDateLableText(cell: cell, indexPath: indexPath, shift: newShift)
            }
            
            // Change color index in aharedData only for current mounth
            if currentYear == presentYear && currentMonthIndex == presentMonthIndex  {
                if shiftTipes.isEmpty {
                    colorIndexes[indexPath.row] = 18
                } else {
                    colorIndexes[indexPath.row] = shiftTypes[shift.shiftTypeIndex].shiftColorIndex
                }
            }
        }
    }
    
    
    func didChangeMonth(monthIndex: Int, year: Int) {
        currentMonthIndex = monthIndex + 1
        currentYear = year
        
        // For leap year, make february month of 29 days
        if monthIndex == 1 {
            if currentYear % 4 == 0 {
                numbersOfDaysInMonth[monthIndex] = 29
            } else {
                numbersOfDaysInMonth[monthIndex] = 28
            }
        }
        
        firstWeekDayOfMonth = getIndexFirstWeekDay(currentYear: currentYear, currentMonthIndex: currentMonthIndex)
    }
    
    //MARK:  Set text color in dateLabel in cell
    func setColorInDateLableText(cell: UICollectionViewCell, indexPath: IndexPath, shift: Shift) {
        let cell = cell  as! DateCollectionViewCell
        if  shift.shiftTypeIndex != 0 {
            cell.dateLabel.textColor = .white
            cell.drowCircleForToday(color: .white)
        } else {
            
            //  Add weekend. Mark weekend in grey
            switch indexPath.row {
            case 5, 6, 12, 13, 19, 20, 26, 27, 33, 34:
                cell.dateLabel.textColor = .lightGray
            default:
                cell.dateLabel.textColor = .black
            }
            cell.drowCircleForToday(color: .red)
        }
    }
}



