//
//  TeamScheduleCalendarFooter.swift
//  Smenka
//
//  Created by Viktor on 29.03.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

class CalendarFooterLineCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let calendarFooterCollectionViewCellIdentifire = "calendarFooterCollectionViewCell"
    
    let staffLabel: UILabel = {
        let label = UILabel()
        label.text = "The number\n of employees"
        label.font = UIFont.italicSystemFont(ofSize: 10)
        label.textColor = Style.labelColor
        label.textAlignment = .right
        label.numberOfLines = 2
        label.backgroundColor = .clear
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: calendarFooterCollectionViewCellIdentifire, for: indexPath) as! CalendarCollectionViewCell
        
        cell.shftLabel.backgroundColor = Style.teamScheduleSistemColor
        cell.shftLabel.text = "0"
        
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
        
        shiftCollectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: calendarFooterCollectionViewCellIdentifire)
        
        
        staffLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 1).isActive = true
        staffLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 1).isActive = true
        staffLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        staffLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        shiftCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        shiftCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        shiftCollectionView.leftAnchor.constraint(equalTo: staffLabel.rightAnchor, constant: 5).isActive = true
        shiftCollectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0(150)]-5-[v1]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": staffLabel, "v1": shiftCollectionView]))
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-1-[v0]-1-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": staffLabel]))
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": shiftCollectionView]))
    }
}
