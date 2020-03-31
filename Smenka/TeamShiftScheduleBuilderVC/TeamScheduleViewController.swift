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
    
    let teamScheduleCollectionView: TeamScheduleCollectionView = {
        let collectionView = TeamScheduleCollectionView()
        return collectionView
    }()
    
    let monthLabel: UILabel = {
        let label = UILabel()
        label.text = "March 2020"
        
        let formattedString = NSMutableAttributedString()
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
        
        setupViews()
        
        teamScheduleCollectionView.delegate = self
        teamScheduleCollectionView.dataSource = self
        
        teamScheduleCollectionView.register(CalendarHeaderLineCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerCollectionViewCellIdentifire)
        teamScheduleCollectionView.register(CalendarFooterLineCell.self, forCellWithReuseIdentifier: footerCollectionViewCellIdentifire)
        teamScheduleCollectionView.register(SchedulesCell.self, forCellWithReuseIdentifier: schedulesCellIdentifire)
        
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            let height = view.frame.height - 142 - CGFloat(Int(view.frame.height - 142) % 27)
        return CGSize(width: view.frame.width, height: height)
        }
        return CGSize(width: view.frame.width, height: 30)
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
    
    func setupViews() {
        view.backgroundColor = Style.backgroundColor
        
        view.addSubview(monthLabel)
        view.addSubview(addStaffButton)
        view.addSubview(backButton)
        view.addSubview(teamScheduleCollectionView)

        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        addStaffButton.addTarget(self, action: #selector(addStaffButtonPressed), for: .touchUpInside)
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-44-[v0]-60-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": teamScheduleCollectionView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-60-[v0(150)]-500@900-[v1(80)]-[v2(80)]-60-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": monthLabel, "v1": addStaffButton, "v2": backButton]))
            
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0]-5-[v1]-20-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": backButton, "v1": teamScheduleCollectionView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0]-5-[v1]-20-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": addStaffButton, "v1": teamScheduleCollectionView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0]-5-[v1]-20-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": monthLabel, "v1": teamScheduleCollectionView]))
        
    
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

class TeamScheduleCollectionView: BaseCollectionView {
    
    override func setupViews() {
        backgroundColor = .clear
        showsVerticalScrollIndicator = false
        alwaysBounceVertical = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}

class BaseCollectionView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.sectionHeadersPinToVisibleBounds = true
        super.init(frame: frame, collectionViewLayout: layout)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
    }
    
}




