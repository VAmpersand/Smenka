//
//  MainViewController.swift
//  Smenka
//
//  Created by Viktor on 21.01.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit
import Foundation

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var calendarCollectionView: UICollectionView!
    @IBOutlet var monthLabel: UILabel!
    
    var currentMonth = 0

    var currentMonthIndex: Int = 0
    var currentYear: Int = 0
    var firstWeekDayOfMonth = 0   //(Sunday-Saturday 1-7)
    var presentMonthIndex = 0
    var presentYear = 0
    var todaysDate = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        currentMonthIndex = Calendar.current.component(.month, from: Date())
        currentYear = Calendar.current.component(.year, from: Date())
        todaysDate = Calendar.current.component(.day, from: Date())
        
        currentMonth = currentMonthIndex - 1
        
        presentMonthIndex = currentMonthIndex
        presentYear = currentYear
        
        firstWeekDayOfMonth = getFirstWeekDay()
        
        monthLabel.text="\(months[currentMonth]) \(currentYear)"
    }
    
    
    @IBAction func Next(_ sender: Any) {
        
        currentMonth += 1
        if currentMonth > 11 {
            currentMonth = 0
            currentYear += 1
        }
        
        monthLabel.text="\(months[currentMonth]) \(currentYear)"
        
        didChangeMonth(monthIndex: currentMonth, year: currentYear)
        calendarCollectionView.reloadData()
        
    }
    
    @IBAction func Back(_ sender: Any) {
        
        currentMonth -= 1
        if currentMonth < 0 {
            currentMonth = 11
            currentYear -= 1
        }
        
        monthLabel.text="\(months[currentMonth]) \(currentYear)"
        
         didChangeMonth(monthIndex: currentMonth, year: currentYear)
        calendarCollectionView.reloadData()
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbersOfDaysInMonth[currentMonthIndex - 1] + firstWeekDayOfMonth - 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Calendar", for: indexPath) as! DateCollectionViewCell
        
        cell.backgroundColor = .clear
        cell.dateLabel.textColor = .black
        
        
        if indexPath.item <= firstWeekDayOfMonth - 2 {
            cell.isHidden = true
        } else {
            let calcDate = indexPath.row - firstWeekDayOfMonth + 2
            cell.isHidden = false
            cell.dateLabel.text = "\(calcDate)"
            if calcDate == todaysDate && currentYear == presentYear && currentMonthIndex == presentMonthIndex {
                                      cell.isUserInteractionEnabled = false
                                      cell.dateLabel.textColor = UIColor.lightGray
                                  } else {
                                      cell.isUserInteractionEnabled = true
//                                 cell.dateLabel.textColor = Style.activeCellLblColor
            }
        }
        
        
        //         Add weekend. Mark weekend in grey
        switch indexPath.row {
        case 5, 6, 12, 13, 19, 20, 26, 27, 33, 34:
            if Int(cell.dateLabel.text!)! > 0 {
                cell.dateLabel.textColor = UIColor.lightGray
            }
        default:
            break
        }
        
        // Mark the currend day in red
//        if  currentYear == presentYear && currentMonthIndex == presentMonthIndex &&
//            Int(cell.dateLabel.text!)! == todaysDate {
//            cell.backgroundColor = .red
//        }
        
        return cell
    }
    
    func getFirstWeekDay() -> Int {
        let day = ("\(currentYear)-\(currentMonthIndex)-01".dateStr?.firstDayOfTheMonth.weekday)!
        //return day == 7 ? 1 : day
        return day
    }
    
    func didChangeMonth(monthIndex: Int, year: Int) {
        currentMonthIndex = monthIndex+1
        currentYear = year
        
        //for leap year, make february month of 29 days
        if monthIndex == 1 {
            if currentYear % 4 == 0 {
                numbersOfDaysInMonth[monthIndex] = 29
            } else {
                numbersOfDaysInMonth[monthIndex] = 28
            }
        }
        //end
        
        firstWeekDayOfMonth=getFirstWeekDay()
    }
    
}

extension String {
    static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    var dateStr: Date? {
        return String.dateFormatter.date(from: self)
    }
}

extension Date {
    var weekday: Int {
        var weekday = Calendar.current.component(.weekday, from: self) - 1
        
        if weekday == 0 {
            weekday = 7
        }
        return weekday
    }
    var firstDayOfTheMonth: Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year,.month], from: self))!
    }
}
