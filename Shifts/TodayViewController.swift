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
    }
    
    
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        if activeDisplayMode == .compact {
            self.preferredContentSize = maxSize
        } else if activeDisplayMode == .expanded {
            self.preferredContentSize = CGSize(width: maxSize.width, height: 370)
        }
    }
    
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        
        let widgetUserDefaults = UserDefaults.init(suiteName: "group.Smenka.widgetShare")
        let urlStr = widgetUserDefaults?.value(forKey: "fileURL")
        
        guard let url = URL(string: urlStr as! String) else { return }
        
        
//        URLSession.shared.dataTask(with: url!) { (data, response, error) in
//            
//            guard let data = data else { return }
//            guard error == nil else { return }
//            print(data)
//            
//        }
//        
//
        do {
            let data = try Data(contentsOf: url)
            print(data)
        } catch {
            print(error.localizedDescription)
        }

        
        print(urlStr!)
        print(url)
        completionHandler(NCUpdateResult.newData)
    }
    
    
}

