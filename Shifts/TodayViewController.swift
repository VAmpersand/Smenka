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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.extensionContext?.widgetLargestAvailableDisplayMode = .expanded
        setDelegate()
        
        let color = CGColor(srgbRed: 1, green: 1, blue: 1, alpha: 0.3)
        calendarCollectionView.backgroundColor = UIColor(cgColor: color)
        calendarCollectionView.layer.cornerRadius = 15
    }
    
    
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        if activeDisplayMode == .compact {
            self.preferredContentSize = maxSize
        } else if activeDisplayMode == .expanded {
            self.preferredContentSize = CGSize(width: maxSize.width, height: 370)
        }
    }
    
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        decodeData()
        completionHandler(NCUpdateResult.newData)
    }
    
    
    
    func decodeData() {
        
        let widgetUserDefaults = UserDefaults.init(suiteName: "group.Smenka.widgetShare")
        let urlStr = widgetUserDefaults?.value(forKey: "fileURL")
        
        guard let url = URL(string: urlStr as! String) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            
//            let schedaleShifts: ScheduleShifts = try! JSONDecoder().decode(ScheduleShifts.self, for: data)
            
            print(data)
        } catch {
            print(error.localizedDescription)
        }
         print(url)
    }
    
    func setDelegate() {
        calendarCollectionView.delegate = self as! UICollectionViewDelegate
        calendarCollectionView.dataSource = self  as! UICollectionViewDataSource
    }
    
    
}

