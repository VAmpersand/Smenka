//
//  TeamShiftScheduleViewController.swift
//  Smenka
//
//  Created by Viktor on 07.03.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

class TeamShiftScheduleViewController: UIViewController {
    
    @IBOutlet var backButton: UIButton!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var monthLabel: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    
    @IBOutlet var customNavigationBar: CustomNavigationBarTeamShSchV!
    
    let cellID = "cellID"
    var currentYear = 0
    var currentMonthIndex = 0
    var currentMonth = 0
    var currentDay = 0
    
    var tempIndexPath: IndexPath!
    
    var firstWeekDayOfMonth = 0
    var weekdays: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentYear = Calendar.current.component(.year, from: Date())
        currentMonthIndex = Calendar.current.component(.month, from: Date())
        currentDay = Calendar.current.component(.day, from: Date())
        
        firstWeekDayOfMonth = getIndexFirstWeekDay(currentYear: currentYear, currentMonthIndex: currentMonthIndex)
        weekdays = getWeekdaysArray(currentMonth: currentMonth, firstWeekDayOfMonth: firstWeekDayOfMonth)
        
        monthLabel.text = "\(months[currentMonth]) \(currentYear)"
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        customNavigationBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        setDesign()
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        
        currentMonth += 1
        if currentMonth > 11 {
            currentMonth = 0
            currentYear += 1
        }
        
        monthLabel.text="\(months[currentMonth]) \(currentYear)"
        didChangeMonth(currentMonth: currentMonth, year: currentYear)
        collectionView.reloadData()
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        currentMonth -= 1
        if currentMonth < 0 {
            currentMonth = 11
            currentYear -= 1
        }
        
        monthLabel.text = "\(months[currentMonth]) \(currentYear)"
        didChangeMonth(currentMonth: currentMonth, year: currentYear)
        collectionView.reloadData()
    }
    
    func setDesign() {
        self.view.backgroundColor = Style.backgroundColor
        nextButton.setTitleColor(Style.labelColor, for: .normal)
        backButton.setTitleColor(Style.labelColor, for: .normal)
        monthLabel.textColor = Style.labelColor
        collectionView.backgroundColor = .clear
        customNavigationBar.setDesign()
        
        collectionView.showsHorizontalScrollIndicator = false
        if tempIndexPath != nil {
        collectionView.scrollToItem(at: tempIndexPath, at: .left, animated: false)
        }
    }
    
    func getWeekdaysArray(currentMonth: Int, firstWeekDayOfMonth: Int) -> [String] {
        
        var daysCount = numbersOfDaysInMonth[currentMonth]
        
        //    For leap year, make february month of 29 days
        if currentMonth == 1 {
            if currentYear % 4 == 0 {
                daysCount = 29
            } else {
                daysCount = 28
            }
        }
      
        var currentWeekday = firstWeekDayOfMonth - 1
   
        var weekdays: [String] = []
        var counter = 1
        
        while counter != daysCount + 1 {
            weekdays.append(daysOfWeek[currentWeekday])
            currentWeekday += 1
            if currentWeekday == 7 {
                currentWeekday = 0
            }
            counter += 1
        }
        
        return weekdays
    }
    
    func didChangeMonth(currentMonth: Int, year: Int) {
        currentMonthIndex = currentMonth + 1
        currentYear = year
        
        // For leap year, make february month of 29 days
        if currentMonth == 1 {
            if currentYear % 4 == 0 {
                numbersOfDaysInMonth[currentMonth] = 29
            } else {
                numbersOfDaysInMonth[currentMonth] = 28
            }
        }
        
        firstWeekDayOfMonth = getIndexFirstWeekDay(currentYear: currentYear, currentMonthIndex: currentMonthIndex)
        weekdays = getWeekdaysArray(currentMonth: currentMonth, firstWeekDayOfMonth: firstWeekDayOfMonth)
    }
}


extension TeamShiftScheduleViewController: PresentShiftScheduleBuilderDelegate {
    
    func editButtonPressed() {
        performSegue(withIdentifier: "segueToShSchBuilder", sender: self)
    }
}
