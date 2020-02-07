//
//  MainViewController.swift
//  Smenka
//
//  Created by Viktor on 21.01.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit
import RealmSwift

class MainViewController: UIViewController {
    
    @IBOutlet var calendarCollectionView: UICollectionView!
    @IBOutlet weak var stuffShiftTableView: UITableView!
    
    @IBOutlet weak var addStaffButton: UIButton!
    
    @IBOutlet var monthLabel: UILabel!
    @IBOutlet weak var blurEffect: UIVisualEffectView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    var schedulesShifts: Results<ScheduleShifts>!
    
    var currentYear = 0
    var presentYear = 0
    
    var currentMonth = 0
    
    var currentMonthIndex = 0
    var presentMonthIndex = 0
    
    var firstWeekDayOfMonth = 0   //(Sunday-Saturday 1-7)
    var todaysDate = 0
    
    var editButtonPressCheck = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Realm.Configuration.defaultConfiguration.description)
        
        currentMonthIndex = Calendar.current.component(.month, from: Date())
        currentYear = Calendar.current.component(.year, from: Date())
        todaysDate = Calendar.current.component(.day, from: Date())
        
        presentMonthIndex = currentMonthIndex
        presentYear = currentYear
        
        currentMonth = currentMonthIndex - 1
        
        firstWeekDayOfMonth = getIndexFirstWeekDay(currentYear: currentYear, currentMonthIndex: currentMonthIndex)
        
        monthLabel.text="\(months[currentMonth]) \(currentYear)"
        
        calendarCollectionView.layer.cornerRadius = 15
        stuffShiftTableView.layer.cornerRadius = 15
        deleteButton.isHidden = true
        addStaffButton.isHidden = true
        
        stuffShiftTableView.delegate = self
        stuffShiftTableView.dataSource = self
        
        schedulesShifts = realm.objects(ScheduleShifts.self)
            
        // Test creatng scheduleShifts
        guard let schedulesShifts = schedulesShifts else { return }
        let nameIsMatch = checkTheScheduleForExistence(schedulesShifts: schedulesShifts, currentYear: currentYear, currentMonthIndex: currentMonthIndex)
        
        if  !nameIsMatch {
            let scheduleShifts = setEmptyScheduleShifts(currentYear: currentYear, currentMonthIndex: currentMonthIndex)
            DispatchQueue.main.async {
                StorageManager.saveScheduleShift(scheduleShifts)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        // Leap year check before calendar display
        didChangeMonth(monthIndex: currentMonth, year: currentYear)
        
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
    
    @IBAction func editButtonPressed(_ sender: Any) {
        
        editButtonPressCheck.toggle()
        
        if editButtonPressCheck {
            editButton.setTitle("Save", for: .normal)
            editButton.setTitleColor(.white, for: .normal)
            deleteButton.isHidden = false
            deleteButton.setTitleColor(.white, for: .normal)
            addStaffButton.isHidden = false
            addStaffButton.setTitleColor(.white, for: .normal)
            UIView.animate(withDuration: 1) {
                self.blurEffect.alpha = 0.9
            }
            
            // Create empty schedulShifts if is has not been previously created
            guard let scheduleShifts = schedulesShifts else { return }
            let nameIsMatch = checkTheScheduleForExistence(schedulesShifts: scheduleShifts, currentYear: currentYear, currentMonthIndex: currentMonthIndex)
            
            if  !nameIsMatch {
                let scheduleShifts = setEmptyScheduleShifts(currentYear: currentYear, currentMonthIndex: currentMonthIndex)
                DispatchQueue.main.async {
                    StorageManager.saveScheduleShift(scheduleShifts)
                }
            }
            
        } else {
            editButton.setTitle("Edit", for: .normal)
            editButton.setTitleColor(.blue, for: .normal)
            deleteButton.isHidden = true
            addStaffButton.isHidden = true
            UIView.animate(withDuration: 1) {
                self.blurEffect.alpha = 0
            }
            
           // Delete empty schedulShifts if is has not been previously edited
            guard let schedulesShifts = schedulesShifts else { return }
            let shiftIsEdited = checkTheScheduleForEmptiness(schedulesShifts: schedulesShifts, currentYear: currentYear, currentMonthIndex: currentMonthIndex)
            
            if !shiftIsEdited {
            removeSchedulleShifts(schedulesShifts: schedulesShifts, currentYear: currentYear, currentMonthIndex: currentMonthIndex)
            }
        }
    }
    
    
    @IBAction func deleteCurrentScheduleShifts(_ sender: Any) {
        
        guard let schedulesShifts = schedulesShifts else { return }
        DispatchQueue.main.async {
            removeSchedulleShifts(schedulesShifts: schedulesShifts, currentYear: self.currentYear, currentMonthIndex: self.currentMonthIndex)
            self.calendarCollectionView.reloadData()
        }
    }
    
    
    @IBAction func addStaff(_ sender: Any) {
    }
    
}


