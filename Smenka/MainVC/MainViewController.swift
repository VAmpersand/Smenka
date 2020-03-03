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
    
    class func initMainVC() -> MainViewController {
        let storyboard = UIStoryboard(name: "MainVCStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "mainViewController") as! MainViewController
        return vc
    }
    
    @IBOutlet var calendarCollectionView: UICollectionView!
    @IBOutlet var shiftTypeTable: UITableView!
    @IBOutlet var monthLabel: UILabel!
    @IBOutlet var shiftTypesLabel: UILabel!
    @IBOutlet var daysLabels: [UILabel]!
    @IBOutlet var blurEffect: UIVisualEffectView!
    @IBOutlet var customNavigationBar: CustomNavigationBarInMainVC!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var backButton: UIButton!
    
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
    
    var editButtonPressed = false
    var currentIndexPath: IndexPath!
    
    var theme: ThemeStyle!
    
    let themeStyleDelegate = CustomNavigationBarInSettingsVC()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDefaultDBRealmDirectory()
        getEmptySharedDate()
        getEmptyColorIndexes()
        
        currentMonthIndex = Calendar.current.component(.month, from: Date())
        currentYear = Calendar.current.component(.year, from: Date())
        todaysDate = Calendar.current.component(.day, from: Date())
        
        presentMonthIndex = currentMonthIndex
        presentYear = currentYear
        
        currentMonth = currentMonthIndex - 1
        
        firstWeekDayOfMonth = getIndexFirstWeekDay(currentYear: currentYear, currentMonthIndex: currentMonthIndex)
        
        monthLabel.text = "\(months[currentMonth]) \(currentYear)"
   
        shiftTypeTable.delegate = self
        shiftTypeTable.dataSource = self
        
        customNavigationBar.delegate = self
        themeStyleDelegate.delegate = self
        
        schedulesShifts = realm.objects(ScheduleShifts.self)
        shiftTypes = realm.objects(ShiftType.self)
        //        staff = realm.objects(Staff.self)
        
        if !checkTheShiftTypeForExistence(shiftTypes: shiftTypes, shiftTypeName: "Clear shift type") {
            setFirstClearShiftType()
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        // Leap year check before calendar display
        didChangeMonth(monthIndex: currentMonth, year: currentYear)
        
        setDesign()
        shiftTypeTable.reloadData()
        shareDataInWidget()
    }
    
    
    func setDesign() {
        
        self.view.backgroundColor = Style.backgroundColor
        shiftTypeTable.backgroundColor = Style.backgroundColor
        calendarCollectionView.backgroundColor = Style.backgroundColor
        monthLabel.textColor = Style.labelColor
        shiftTypesLabel.textColor = Style.labelColor
        nextButton.setTitleColor(Style.labelColor, for: .normal)
        backButton.setTitleColor(Style.labelColor, for: .normal)
        
        for label in daysLabels {
            label.textColor = Style.labelColor
        }
        calendarCollectionView.reloadData()
        
        customNavigationBar.setDesign()
        
        calendarCollectionView.layer.cornerRadius = 15
        shiftTypeTable.layer.cornerRadius = 15
               
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
        
        guard let defaultTheme = defaultThemeStyle.value(forKey: "defaultTheme") as? String else { return }
        print(defaultTheme)
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
        
        defaultThemeStyle.removeObject(forKey: "defaultTheme")
    }
    
    //MARK: Delete current schedule shifts
    @IBAction func deleteCurrentScheduleShifts(_ sender: Any) {
        
        showMessageView(text: "Are you sure you want to delete the shift schedule for \(months[currentMonth]) \(currentYear)")
    }
    
    //MARK: Show view with question about deleting schedule shifts
    func showMessageView(text: String) {
        
        let validationCheckRemovalView = UIStoryboard(name: "Alert", bundle: nil).instantiateViewController(withIdentifier: "validationCheckRemovalView") as! ValidationCheckRemovalView
        validationCheckRemovalView.delegate = self
        
        self.addChild(validationCheckRemovalView)
        validationCheckRemovalView.view.frame = self.view.frame
        self.view.addSubview(validationCheckRemovalView.view)
        validationCheckRemovalView.didMove(toParent: self)
        validationCheckRemovalView.textMessageLabel.text = text
    }
    
    func shareDataInWidget() {
        let widgetUserDefaults = UserDefaults(suiteName: "group.Smenka.widgetShare")
        widgetUserDefaults?.setValue(colorIndexes, forKey: "colorIndexes")
        widgetUserDefaults?.setValue(sharedDate, forKey: "sharedDate")
    }
    
}

extension MainViewController: DeleteButtonDelegate {
    
    func okButtonPressedWhenDeleting() {
        
        editButtonPressed.toggle()
        UIView.animate(withDuration: 1) {
            self.blurEffect.alpha = 0
        }
        
        guard let schedulesShifts = schedulesShifts else { return }
        removeSchedulleShifts(schedulesShifts: schedulesShifts, currentYear: currentYear, currentMonthIndex: self.currentMonthIndex)
        DispatchQueue.main.async {
            self.calendarCollectionView.reloadData()
        }
        
        for scheduleShift in schedulesShifts {
            if scheduleShift.monthlyScheduleName == "\(currentYear)-\(currentMonthIndex)" {
                getEmptyColorIndexes()
            }
        }
        
        customNavigationBar.editButtonPressed.toggle()
        customNavigationBar.deleteButton.isHidden = true
        customNavigationBar.editButton.setTitle("Edit", for: .normal)
        
        shareDataInWidget()
    }
}

extension MainViewController: MainNavigationBarDelegate {
    
    func editAction() {
        editButtonPressed.toggle()
        
        if editButtonPressed {
            UIView.animate(withDuration: 1) {
                self.blurEffect.alpha = 0.9
            }
            
            //MARK: Create empty schedulShifts if is has not been previously created
            let nameIsMatch = checkTheScheduleForExistence(schedulesShifts: schedulesShifts, currentYear: currentYear, currentMonthIndex: currentMonthIndex)
            
            if  !nameIsMatch {
                let scheduleShifts = setEmptyScheduleShifts(currentYear: currentYear, currentMonthIndex: currentMonthIndex)
                DispatchQueue.main.async {
                    StorageManager.saveScheduleShift(scheduleShifts)
                }
            }
        } else {
            UIView.animate(withDuration: 1) {
                self.blurEffect.alpha = 0
            }
            
            //MARK: Delete empty schedulShifts if is has not been previously edited
            let shiftIsEdited = checkTheScheduleForEmptiness(schedulesShifts: schedulesShifts, currentYear: currentYear, currentMonthIndex: currentMonthIndex)
            
            if !shiftIsEdited {
                removeSchedulleShifts(schedulesShifts: schedulesShifts, currentYear: currentYear, currentMonthIndex: currentMonthIndex)
            }
            
            shareDataInWidget()
        }
    }
    
    
    //MARK: Delete current schedule shifts
    func deleteAction() {
        showMessageView(text: "Are you sure you want to delete the shift schedule for \(months[currentMonth]) \(currentYear)")
    }
    
}

extension MainViewController: ThemeChangingDelegate {
    
    func themeIsTogle() {
        
        self.view.backgroundColor = Style.backgroundColor
        shiftTypeTable.backgroundColor = Style.backgroundColor
        calendarCollectionView.backgroundColor = Style.backgroundColor
        calendarCollectionView.reloadData()
        
    }
}




