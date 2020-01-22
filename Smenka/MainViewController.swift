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
    
    
    
    var currentMonth = String()
    var numberOfEmptyBox = Int()
    var nextNumberOfEmptyBox = Int()
    var previousNumberOfEmptyBox = 0
    var direction = 0
    var positionIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentMonth = months[month]
        monthLabel.text = currentMonth + " \(year)"
        
    }
    
    
    @IBAction func Next(_ sender: Any) {
        
        
        switch currentMonth {
        case "December":
            
            direction = 1
            getStartDateDayPosition()
            
            month = 0
            year += 1
            currentMonth = months[month]
            monthLabel.text = currentMonth + " \(year)"
            calendarCollectionView.reloadData()
        default:
            
            direction = 1
            getStartDateDayPosition()
            
            month += 1
            currentMonth = months[month]
            monthLabel.text = currentMonth + " \(year)"
            calendarCollectionView.reloadData()
        }
    }
    
    @IBAction func Back(_ sender: Any) { 
        
        switch currentMonth {
        case "January":
            
            direction = -1
            getStartDateDayPosition()
            
            month = 11
            year -= 1
            currentMonth = months[month]
            monthLabel.text = currentMonth + " \(year)"
            calendarCollectionView.reloadData()
        default:
            
            direction = -1
            getStartDateDayPosition()
            
            month -= 1
            currentMonth = months[month]
            monthLabel.text = currentMonth + " \(year)"
            calendarCollectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch direction{
        case 0:
            return daysInMonth[month] + numberOfEmptyBox
        case 1...:
            return daysInMonth[month] + nextNumberOfEmptyBox
        case -1:
            return daysInMonth[month] + previousNumberOfEmptyBox
        default:
            fatalError()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Calendar", for: indexPath) as! DateCollectionViewCell
        
        cell.backgroundColor = .clear
        cell.dateLabel.textColor = .black
        
        if cell.isHidden {
            cell.isHidden = false
        }
        
        switch direction{
        case 0:
            cell.dateLabel.text = "\(indexPath.row + 1 - numberOfEmptyBox)"
        case 1...:
            cell.dateLabel.text = "\(indexPath.row + 1 - nextNumberOfEmptyBox)"
        case -1:
            cell.dateLabel.text = "\(indexPath.row + 1 - previousNumberOfEmptyBox)"
        default:
            fatalError()
        }
        
        if Int(cell.dateLabel.text!)! < 1 {
            cell.isHidden = true
        }
        
        switch indexPath.row {
        case 5, 6, 12, 13, 19, 20, 26, 27, 33, 34:
            if Int(cell.dateLabel.text!)! > 0 {
                cell.dateLabel.textColor = UIColor.lightGray
                   }
        default:
            break
        }
        
        if currentMonth == months[month] && year == year && indexPath.row + 1 == day {
            cell.backgroundColor = .red
        }
        
        return cell
    }
    
}

//extension MainViewController {
//
//    func setMonthLabel() {
//        currentMonth = months[month]
//        monthLabel.text = currentMonth + " \(year)"
//    }
//}

