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
    
    let collectionViewCellIdentifire = "collectionViewCell"
    let headerCollectionViewCellIdentifire = "headerCollectionViewCell"
    let footerCollectionViewCellIdentifire = "footerCollectionViewCell"
    
    let teamScheduleCollectionView: TeamScheduleCollectionView = {
        let collectionView = TeamScheduleCollectionView()
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        teamScheduleCollectionView.delegate = self
        teamScheduleCollectionView.dataSource = self
        teamScheduleCollectionView.register(ScheduleLineCell.self, forCellWithReuseIdentifier: collectionViewCellIdentifire)
        teamScheduleCollectionView.register(CalendarHeaderLineCell.self, forCellWithReuseIdentifier: headerCollectionViewCellIdentifire)
        teamScheduleCollectionView.register(CalendarFooterLineCell.self, forCellWithReuseIdentifier: footerCollectionViewCellIdentifire)
        
        
        // Set landscapeLeft orientaion for this VC
        appDelegate.myOrientation = .landscapeRight
        UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 1 {
            return 10
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: headerCollectionViewCellIdentifire, for: indexPath) as! CalendarHeaderLineCell
            return cell
        } else if indexPath.section == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewCellIdentifire, for: indexPath) as! ScheduleLineCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: footerCollectionViewCellIdentifire, for: indexPath) as! CalendarFooterLineCell
                       return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: view.frame.width, height: 45)
        }
        return CGSize(width: view.frame.width, height: 27)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: 0, height: 0)
        }
        return CGSize(width: view.frame.width, height: 5)
    }
    
    
    func setupViews() {
        self.view.addSubview(teamScheduleCollectionView)
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-40-[v0]-15-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": teamScheduleCollectionView]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-25-[v0]-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": teamScheduleCollectionView]))
        
        view.backgroundColor = Style.backgroundColor
        
    }
    
}

class TeamScheduleCollectionView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        super.init(frame: frame, collectionViewLayout: layout)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        layer.cornerRadius = 15
        backgroundColor = .clear
        showsVerticalScrollIndicator = false
        alwaysBounceVertical = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}




