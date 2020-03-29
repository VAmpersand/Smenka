//
//  CustomCollectionViewCells.swift
//  Smenka
//
//  Created by Viktor on 29.03.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
    }
}

class CalendarHeaderCollectionViewCell: BaseCell {
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Day"
        label.font = UIFont.italicSystemFont(ofSize: 15)
        label.textColor = Style.labelColor
        label.textAlignment = .center
        label.backgroundColor = Style.teamScheduleSistemColor
        label.layer.borderColor = (Style.labelColor).cgColor
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let weekdayLabel: UILabel = {
        let label = UILabel()
        label.text = "Weekday"
        label.font = UIFont.italicSystemFont(ofSize: 15)
        label.textColor = Style.labelColor
        label.textAlignment = .center
        label.backgroundColor = Style.teamScheduleSistemColor
        label.layer.borderColor = (Style.labelColor).cgColor
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setupViews() {
        addSubview(dateLabel)
        addSubview(weekdayLabel)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-1-[v0]-1-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": dateLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-1-[v0]-1-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": weekdayLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-1-[v0(21)]-1-[v1(21)]-1-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": dateLabel, "v1": weekdayLabel]))
    }
}

class CalendarCollectionViewCell: BaseCell {
    
    let shftLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.text = "Day"
        label.textColor = Style.labelColor
        label.textAlignment = .center
        label.font = UIFont.italicSystemFont(ofSize: 15)
        label.layer.borderColor = (Style.labelColor).cgColor
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setupViews() {
        addSubview(shftLabel)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-1-[v0]-1-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": shftLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-1-[v0]-1-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": shftLabel]))
    }
}

