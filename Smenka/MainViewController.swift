//
//  MainViewController.swift
//  Smenka
//
//  Created by Viktor on 21.01.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var calendar: UICollectionView!
    @IBOutlet var monthLabel: UILabel!
    
    var currentMonth = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setMonthLabel()
        
    }
    
    
    
    
    @IBAction func Next(_ sender: Any) {
        switch currentMonth {
        case "December":
            month = 0
            year += 1
            setMonthLabel()
            calendar.reloadData()
        default:
            month += 1
            setMonthLabel()
            calendar.reloadData()
        }
    }
    
    @IBAction func Back(_ sender: Any) {
        switch currentMonth {
        case "January":
            month = 11
            year -= 1
            setMonthLabel()
            calendar.reloadData()
        default:
            month -= 1
            setMonthLabel()
            calendar.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return daysInMonth[month]
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Calendar", for: indexPath) as! DateCollectionViewCell
        
        cell.backgroundColor = UIColor.clear
        cell.dateLabel.text = "\(indexPath.row + 1)"
        
        return cell
    }
    
}

extension MainViewController {
    
    func setMonthLabel() {
        currentMonth = months[month]
        monthLabel.text = currentMonth + " \(year)"
    }
}

