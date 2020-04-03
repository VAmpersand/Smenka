//
//  TeamScheduleCalendarHeader.swift
//  Smenka
//
//  Created by Viktor on 29.03.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

class CalendarHeaderLineCell: BaseCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let calendarHeaderCollectionViewCellIdentifire = "calendarHeaderCollectionViewCell"
        
    let shiftCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.sectionInsetReference = .fromSafeArea
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

        addSubview(shiftCollectionView)
        
        shiftCollectionView.delegate = self
        shiftCollectionView.dataSource = self
        
        shiftCollectionView.register(CalendarHeaderCollectionViewCell.self, forCellWithReuseIdentifier: calendarHeaderCollectionViewCellIdentifire)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-155-[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": shiftCollectionView]))
   
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": shiftCollectionView]))
    }
    
}
