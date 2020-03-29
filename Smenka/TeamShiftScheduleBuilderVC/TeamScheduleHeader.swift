//
//  TeamScheduleHeader.swift
//  Smenka
//
//  Created by Viktor on 29.03.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

class CalendarHeaderLineCell: BaseCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let calendarHeaderCollectionViewCellIdentifire = "calendarHeaderCollectionViewCell"
    
    let monthLabel: UILabel = {
        let label = UILabel()
        label.text = "March 20"
        
        let formattedString = NSMutableAttributedString()
        label.font = UIFont.init(name: "HelveticaNeue-BoldItalic", size: 18)
        label.textColor = Style.labelColor
        label.textAlignment = .center
        label.backgroundColor = .clear
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: calendarHeaderCollectionViewCellIdentifire, for: indexPath) as! CalendarHeaderCollectionViewCell
        
        cell.dateLabel.text = "\(indexPath.row + 1)"
        cell.weekdayLabel.text = weekdays[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 40, height: frame.height)
    }
    
    
    override func setupViews() {
        backgroundColor = Style.backgroundColor
        
        addSubview(monthLabel)
        addSubview(shiftCollectionView)
        
        shiftCollectionView.delegate = self
        shiftCollectionView.dataSource = self
        
        shiftCollectionView.register(CalendarHeaderCollectionViewCell.self, forCellWithReuseIdentifier: calendarHeaderCollectionViewCellIdentifire)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0(140)]-5-[v1]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": monthLabel, "v1": shiftCollectionView]))
   
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": monthLabel]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": shiftCollectionView]))
    }
    
}
