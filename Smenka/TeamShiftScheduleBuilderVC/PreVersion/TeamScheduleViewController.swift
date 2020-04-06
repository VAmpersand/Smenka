//
//  TeamScheduleViewController.swift
//  Smenka
//
//  Created by Viktor on 29.03.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

class TeamScheduleViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // Delegate allowing chenged screen orientation
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    let headerCollectionViewCellIdentifire = "headerCollectionViewCell"
    let schedulesCellIdentifire = "schedulesCell"
    let footerCollectionViewCellIdentifire = "footerCollectionViewCell"
    
    let teamScheduleCollectionView: UICollectionView = {
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
    
    let monthLabel: UILabel = {
        let label = UILabel()
        label.text = "March 2020"
        label.font = UIFont.init(name: "HelveticaNeue-BoldItalic", size: 21)
        label.textColor = Style.labelColor
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addStaffButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add staff", for: .normal)
        button.tintColor = Style.buttonColor
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Back", for: .normal)
        button.tintColor = Style.buttonColor
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Style.backgroundColor
        teamScheduleCollectionView.delegate = self
        teamScheduleCollectionView.dataSource = self
        
        teamScheduleCollectionView.register(CalendarHeaderLineCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerCollectionViewCellIdentifire)
        
        teamScheduleCollectionView.register(SchedulesCell.self, forCellWithReuseIdentifier: schedulesCellIdentifire)
        
        teamScheduleCollectionView.register(CalendarFooterLineCell.self, forCellWithReuseIdentifier: footerCollectionViewCellIdentifire)
        
        // Set landscapeLeft orientaion for this VC
        appDelegate.myOrientation = .landscapeRight
        UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation")
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerCollectionViewCellIdentifire, for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // Calc height
        let height = view.frame.height - 142 - CGFloat(Int(view.frame.height - 142) % 27)
        
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
    
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        
        let newInsets = view.safeAreaInsets
        let leftMargin = newInsets.left > 0 ? newInsets.left : 15
        let rightMargin = newInsets.right > 0 ? newInsets.right : 15
        let topMargin = newInsets.top > 0 ? newInsets.top : 15
        let bottomMargin = newInsets.bottom > 0 ? newInsets.bottom : 15
        
        let metrics = [
            "topMargin": topMargin,
            "bottomMargin": bottomMargin,
            "leftMargin": leftMargin,
            "rightMargin": rightMargin]
        
        
        view.addSubview(monthLabel)
        view.addSubview(addStaffButton)
        view.addSubview(backButton)
        view.addSubview(teamScheduleCollectionView)
        
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        addStaffButton.addTarget(self, action: #selector(addStaffButtonPressed), for: .touchUpInside)
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-leftMargin-[v0]-80-|", options: NSLayoutConstraint.FormatOptions(), metrics: metrics, views: ["v0": teamScheduleCollectionView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-60-[v0(150)]-500@900-[v1(80)]-[v2(80)]-60-|", options: NSLayoutConstraint.FormatOptions(), metrics: metrics, views: ["v0": monthLabel, "v1": addStaffButton, "v2": backButton]))
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0]-5-[v1]-bottomMargin-|", options: NSLayoutConstraint.FormatOptions(), metrics: metrics, views: ["v0": backButton, "v1": teamScheduleCollectionView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10@1000-[v0]-150@250-|", options: NSLayoutConstraint.FormatOptions(), metrics: metrics, views: ["v0": addStaffButton]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10@1000-[v0]-150@250-|", options: NSLayoutConstraint.FormatOptions(), metrics: metrics, views: ["v0": monthLabel]))
        
    }
    
    @objc func backButtonPressed() {
        self.dismiss(animated: true) { () -> Void in
            
            // Set portrait orientaion for this VC
            self.appDelegate.myOrientation = .portrait
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        }
    }
    
    @objc func addStaffButtonPressed() {
        
        // Present addStaffVC
        let addStaffVC = UIStoryboard(name: "AddStaff", bundle: nil).instantiateViewController(withIdentifier: "addStaff") as! AddStaffViewController
        
        self.addChild(addStaffVC)
        addStaffVC.view.frame = self.view.frame
        self.view.addSubview(addStaffVC.view)
        addStaffVC.didMove(toParent: self)
    }
}






