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
                self.preferredContentSize = CGSize(width: maxSize.width, height: 350)
            }
        }
    
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        completionHandler(NCUpdateResult.newData)
    }
    
}
