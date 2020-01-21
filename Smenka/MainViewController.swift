//
//  MainViewController.swift
//  Smenka
//
//  Created by Viktor on 21.01.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var Calendar: UICollectionView!
    @IBOutlet  var MonthLabel: UILabel!
    
    var currentMonth = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentMonth = months[month]
        MonthLabel.text = currentMonth + " \(year)"
        
    }
    
    
    
    
    @IBAction func Next(_ sender: Any) {
    }
    
    @IBAction func Back(_ sender: Any) {
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

