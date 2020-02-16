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
    @IBOutlet var shiftTypeTable: UITableView!
    
    @IBOutlet var monthLabel: UILabel!
    @IBOutlet var blurEffect: UIVisualEffectView!
    @IBOutlet var editButton: UIButton!
    @IBOutlet var deleteButton: UIButton!
    
    
    var schedulesShifts: Results<ScheduleShifts>!
    var shiftTypes: Results<ShiftType>!
    //    var staff: Results<Staff>!
    
    var currentYear = 0
    var presentYear = 0
    
    var currentMonth = 0
    
    var currentMonthIndex = 0
    var presentMonthIndex = 0
    
    var firstWeekDayOfMonth = 0   //(Sunday-Saturday 1-7)
    var todaysDate = 0
    
    var editButtonPressCheck = false
    var currentIndexPath: IndexPath!
    
    
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
        shiftTypeTable.layer.cornerRadius = 15
        deleteButton.isHidden = true
        
        shiftTypeTable.delegate = self 
        shiftTypeTable.dataSource = self
        
        schedulesShifts = realm.objects(ScheduleShifts.self)
        shiftTypes = realm.objects(ShiftType.self)
        //        staff = realm.objects(Staff.self)
        
        if !checkTheShidtTypeForExistence(shiftTypes: shiftTypes, shiftTypeName: "Clear shift type") {
            setFirstClearShiftType()
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        // Leap year check before calendar display
        didChangeMonth(monthIndex: currentMonth, year: currentYear)
        shiftTypeTable.reloadData()
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
        
        monthLabel.text = "\(months[currentMonth]) \(currentYear)"
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
            UIView.animate(withDuration: 1) {
                self.blurEffect.alpha = 0.9
            }
            
            //MARK: Create empty schedulShifts if is has not been previously created
            guard let scheduleShifts = schedulesShifts else { return }
            let nameIsMatch = checkTheScheduleForExistence(schedulesShifts: scheduleShifts, currentYear: currentYear, currentMonthIndex: currentMonthIndex)
            
            if  !nameIsMatch {
                let scheduleShifts = setEmptyScheduleShifts(currentYear: currentYear, currentMonthIndex: currentMonthIndex)
                DispatchQueue.main.async {
                    StorageManager.saveScheduleShift(scheduleShifts)
                }
            }    
        } else {
            self.editButton.setTitle("Edit", for: .normal)
            self.editButton.setTitleColor(.blue, for: .normal)
            self.deleteButton.isHidden = true
            UIView.animate(withDuration: 1) {
                self.blurEffect.alpha = 0
            }
            
            //MARK: Delete empty schedulShifts if is has not been previously edited
            guard let schedulesShifts = schedulesShifts else { return }
            let shiftIsEdited = checkTheScheduleForEmptiness(schedulesShifts: schedulesShifts, currentYear: currentYear, currentMonthIndex: currentMonthIndex)
            
            if !shiftIsEdited {
                removeSchedulleShifts(schedulesShifts: schedulesShifts, currentYear: currentYear, currentMonthIndex: currentMonthIndex)
            }
           
            showMessageView(text: "The methods in the UIConstraintBasedLayoutDebugging category on UIView listed in <UIKitCore/UIView.h> may also be helpful.")
            
        }
    }
    
    //MARK: Delete current schedule shifts
    @IBAction func deleteCurrentScheduleShifts(_ sender: Any) {
        editButtonPressCheck.toggle()
        editButton.setTitle("Edit", for: .normal)
        editButton.setTitleColor(.blue, for: .normal)
        deleteButton.isHidden = true
        UIView.animate(withDuration: 1) {
            self.blurEffect.alpha = 0
        }
        
        guard let schedulesShifts = schedulesShifts else { return }
        removeSchedulleShifts(schedulesShifts: schedulesShifts, currentYear: currentYear, currentMonthIndex: currentMonthIndex)
        
        calendarCollectionView.reloadData()
        
        
    }    
}

extension MainViewController {
    
    func setFirstClearShiftType() {
        let shiftType = ShiftType()
        shiftType.shiftTypeName = "Clear shift type"
        shiftType.shiftColorIndex = 18
        DispatchQueue.main.async {
            StorageManager.saveShiftType(shiftType)
        }
    }
    
    func showMessageView(text: String) {
        let alertView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "alertView") as! AlertView

        self.addChild(alertView)
        alertView.view.frame = self.view.frame
        self.view.addSubview(alertView.view)
        alertView.didMove(toParent: self)
        alertView.textMessageLabel.text = text
    }
}


