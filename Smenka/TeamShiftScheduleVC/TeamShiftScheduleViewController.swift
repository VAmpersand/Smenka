//
//  TeamShiftScheduleViewController.swift
//  Smenka
//
//  Created by Viktor on 07.03.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit
import RealmSwift


var weekdays: [String] = []

class TeamShiftScheduleViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var backButton: UIButton!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var monthLabel: UILabel!
    @IBOutlet var customNavigationBar: CustomNavigationBarTeamShSchV!
    
    let schedulesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.sectionHeadersPinToVisibleBounds = true
        layout.sectionInsetReference = .fromSafeArea
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.alwaysBounceVertical = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    let headerCollectionViewCellIdentifire = "headerCollectionViewCell"
    let schedulesCellIdentifire = "schedulesCell"
    let footerCollectionViewCellIdentifire = "footerCollectionViewCell"
    
    let cellID = "cellID"
    var currentYear = 0
    var currentMonthIndex = 0
    var currentMonth = 0
    var currentDay = 0
    
    var tempIndexPath: IndexPath!
    var currentContentOffset: CGPoint!
    
    var firstWeekDayOfMonth = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentYear = Calendar.current.component(.year, from: Date())
        currentMonthIndex = Calendar.current.component(.month, from: Date())
        currentDay = Calendar.current.component(.day, from: Date())
        
        currentMonth = currentMonthIndex - 1
        
        firstWeekDayOfMonth = getIndexFirstWeekDay(currentYear: currentYear, currentMonthIndex: currentMonthIndex)
        weekdays = getWeekdaysArray(currentMonth: currentMonth, firstWeekDayOfMonth: firstWeekDayOfMonth, currentYear: currentYear)
        
        monthLabel.text = "\(months[currentMonth]) \(currentYear)"
        
        schedulesCollectionView.delegate = self
        schedulesCollectionView.dataSource = self
        
        schedulesCollectionView.register(CalendarHeaderLineCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerCollectionViewCellIdentifire)
        schedulesCollectionView.register(CalendarFooterLineCell.self, forCellWithReuseIdentifier: footerCollectionViewCellIdentifire)
        schedulesCollectionView.register(SchedulesCell.self, forCellWithReuseIdentifier: schedulesCellIdentifire)
        
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
        
        monthLabel.text = "\(months[currentMonth]) \(currentYear)"
        didChangeMonth(currentMonth: currentMonth, year: currentYear)
        schedulesCollectionView.reloadData()
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        currentMonth -= 1
        if currentMonth < 0 {
            currentMonth = 11
            currentYear -= 1
        }
        
        monthLabel.text = "\(months[currentMonth]) \(currentYear)"
        didChangeMonth(currentMonth: currentMonth, year: currentYear)
        schedulesCollectionView.reloadData()
    }
    
    func setDesign() {
        self.view.backgroundColor = Style.backgroundColor
        nextButton.setTitleColor(Style.labelColor, for: .normal)
        backButton.setTitleColor(Style.labelColor, for: .normal)
        monthLabel.textColor = Style.labelColor
        
        schedulesCollectionView.reloadData()

        customNavigationBar.setDesign()
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: schedulesCellIdentifire, for: indexPath) as! SchedulesCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: footerCollectionViewCellIdentifire, for: indexPath) as! CalendarFooterLineCell
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Calc height
        let height = view.frame.height - 300 - CGFloat(Int(view.frame.height - 300) % 27)
        
        // Calc width
        var width = collectionView.frame.width
        let contentInset = collectionView.contentInset
        width = width - contentInset.left - contentInset.right
        
        if indexPath.section == 0 {
            return CGSize(width: width, height: height)
        }
        return CGSize(width: width, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: view.frame.width, height: 45)
        }
        return CGSize(width: view.frame.width, height: 0)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerCollectionViewCellIdentifire, for: indexPath)
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        
        let newInsets = view.safeAreaInsets
        let leftMargin = newInsets.left > 0 ? newInsets.left : 15
        let rightMargin = newInsets.right > 0 ? newInsets.right : 15
        
        let metrics = [
            "leftMargin": leftMargin,
            "rightMargin": rightMargin]
        
        view.addSubview(schedulesCollectionView)
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v0]-|", options: NSLayoutConstraint.FormatOptions(), metrics: metrics, views: ["v0": schedulesCollectionView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-130-[v0]-90-|", options: NSLayoutConstraint.FormatOptions(), metrics: metrics, views: ["v0": schedulesCollectionView]))
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
        weekdays = getWeekdaysArray(currentMonth: currentMonth, firstWeekDayOfMonth: firstWeekDayOfMonth, currentYear: currentYear)
    }
}

extension TeamShiftScheduleViewController: PresentShiftScheduleBuilderDelegate {
    
    func editButtonPressed() {
//        let teamScheduleVC = TeamScheduleViewController()
//        self.present(teamScheduleVC, animated: true, completion: nil)
        
        performSegue(withIdentifier: "segueToScheduleBuilder", sender: self)
        
    }
}
