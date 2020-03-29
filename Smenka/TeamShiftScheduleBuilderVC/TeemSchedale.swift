//
//  TeemSchedale.swift
//  Smenka
//
//  Created by Viktor on 29.03.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

class ScheduleLineCell: BaseCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let calendarCollectionViewCellIdentifire = "calendarCollectionViewCell"
    
    let staffLabel: UILabel = {
        let label = UILabel()
        label.text = "Staff"
        label.font = UIFont.italicSystemFont(ofSize: 15)
        label.textColor = Style.labelColor
        label.backgroundColor = Style.teamScheduleSistemColor
        label.layer.borderColor = (Style.labelColor).cgColor
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let shiftCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weekdays.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: calendarCollectionViewCellIdentifire, for: indexPath) as! CalendarCollectionViewCell
        
        cell.shftLabel.text = ""

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 40, height: frame.height)
    }
    
    
    override func setupViews() {
        addSubview(staffLabel)
        addSubview(shiftCollectionView)
        
        shiftCollectionView.delegate = self
        shiftCollectionView.dataSource = self
        
        shiftCollectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: calendarCollectionViewCellIdentifire)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-52-[v0(140)]-5-[v1]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": staffLabel, "v1": shiftCollectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-1-[v0]-1-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": staffLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": shiftCollectionView]))
        
    }
    
}
