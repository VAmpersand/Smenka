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
    @IBOutlet var monthLabel: UILabel!
    @IBOutlet weak var blurEffect: UIVisualEffectView!
    @IBOutlet weak var editButton: UIButton!
    
    var schedaleShifts: Results<SchedaleShifts>!
    //    var shifts: Results<Shift>!
    //    var types: Results<ShiftType>!
    
    //    var staff: Results<Staff>!
    
    var currentYear = 0
    var presentYear = 0
    
    var currentMonth = 0
    
    var currentMonthIndex = 0
    var presentMonthIndex = 0
    
    var firstWeekDayOfMonth = 0   //(Sunday-Saturday 1-7)
    var todaysDate = 0
    
    var editButtonPressCheck = false
    
    var testSchedalaShifts = SchedaleShifts()
    
    
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
        
        schedaleShifts = realm.objects(SchedaleShifts.self)
        //        shifts = realm.objects(Shift.self)
        //        types = realm.objects(ShiftType.self)
        //        staff = realm.objects(Staff.self)
        
        setTestShifts()
        setTestSchedalShifts()
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
        print("\(currentYear)-\(currentMonthIndex)")
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
            UIView.animate(withDuration: 1) {
                self.blurEffect.alpha = 0.9
            }
            checkTheSchedallForExistence()
        } else {
            editButton.setTitle("Edit", for: .normal)
            UIView.animate(withDuration: 1) {
                self.blurEffect.alpha = 0
            }
        }
    }
    
    
    func setTestSchedalShifts() {
        
        let schedaleShifts = SchedaleShifts()
        schedaleShifts.monthlyScheduleName = "\(currentYear)-\(currentMonthIndex)"
        
        var emptyBoxCounter = 0
        var counter = 0
        
        while counter != 31 {
            counter += 1
            let shift = Shift()
            shift.shiftDate = ("\(currentYear)-\(currentMonthIndex)-\(counter)").dateStr!
            schedaleShifts.shifts.append(shift)
            
        }
        
        while emptyBoxCounter != firstWeekDayOfMonth - 1 {
            emptyBoxCounter += 1
            schedaleShifts.shifts.insert(Shift(), at: 0)
        }
        
        
        
        
        StorageManager.saveSchedaleShift(schedaleShifts)
        
    }
    
    func checkTheSchedallForExistence() {
        
        let currentSchedalName = "\(currentYear)-\(currentMonthIndex)"
        var nameMatch = false
        
        for schedalShift in schedaleShifts {
            if schedalShift.monthlyScheduleName == currentSchedalName {
                nameMatch = true
            }
        }
        
        if !nameMatch {
            setTestSchedalShifts()
        }
    }
}


