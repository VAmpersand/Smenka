//
//  TodayViewController.swift
//  Shifts
//
//  Created by Viktor on 18.02.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var calendarCollectionView: UICollectionView!
    
    var currentDay = 0
    var colorIndexes: [Int] = []
    var sharedDate: [Int] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.extensionContext?.widgetLargestAvailableDisplayMode = .expanded
        
        setDelegate()
        
        let color = CGColor(srgbRed: 1, green: 1, blue: 1, alpha: 0.3)
        calendarCollectionView.backgroundColor = UIColor(cgColor: color)
        calendarCollectionView.layer.cornerRadius = 15
        
        let currentMonth = Calendar.current.component(.month, from: Date()) - 1
        let currentYear = Calendar.current.component(.year, from: Date())
        currentDay = Calendar.current.component(.day, from: Date())
        monthLabel.text = "\(months[currentMonth]) \(currentYear)"
    }
    
    
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        if activeDisplayMode == .compact {
            self.preferredContentSize = maxSize
        } else if activeDisplayMode == .expanded {
            self.preferredContentSize = CGSize(width: maxSize.width, height: 370)
        }
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        getData()
        completionHandler(NCUpdateResult.newData)
    }
    
    func getData() {
        
        let widgetUserDefaults = UserDefaults.init(suiteName: "group.Smenka.widgetShare")
        colorIndexes = widgetUserDefaults?.value(forKey: "colorIndexes") as! [Int]
        sharedDate = widgetUserDefaults?.value(forKey: "sharedDate") as! [Int]
        
        calendarCollectionView.reloadData()
    }
    
    
    func setDelegate() {
        calendarCollectionView.delegate = (self as! UICollectionViewDelegate)
        calendarCollectionView.dataSource = (self  as! UICollectionViewDataSource)
    }
    
}

