//
//  TeamScheduleShiftViewController.swift
//  Smenka
//
//  Created by Viktor on 06.04.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit
import SpreadsheetView

class TeamScheduleBuilderViewController: UIViewController  {
    
    // Delegate allowing chenged screen orientation
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var teamScheduleView: SpreadsheetView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var addStaffButton: UIButton!
    
    var weekendsIndexes: [Int] = []
    let testNuberOfRows = 15
    
    let gridlineColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        teamScheduleView.delegate = self
        teamScheduleView.dataSource = self
        
        weekendsIndexes = getWeekendsIndexesForCurrentMonth(weekdays: weekdays)
        print(weekendsIndexes)
        
//        teamScheduleView.intercellSpacing = CGSize(width: 5, height: 5)
        teamScheduleView.backgroundColor = .clear
        teamScheduleView.register(SpreadsheetViewCell.self, forCellWithReuseIdentifier: "cellID")
        
        // Set landscapeLeft orientaion for this VC
        appDelegate.myOrientation = .landscapeRight
        UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation")
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true) { () -> Void in
            
            // Set portrait orientaion for this VC
            self.appDelegate.myOrientation = .portrait
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        }
    }
    
    @IBAction func addStaffButtonPressed(_ sender: Any) {
        
         // Present addStaffVC
         let addStaffVC = UIStoryboard(name: "AddStaff", bundle: nil).instantiateViewController(withIdentifier: "addStaff") as! AddStaffViewController
         
         self.addChild(addStaffVC)
         addStaffVC.view.frame = self.view.frame
         self.view.addSubview(addStaffVC.view)
         addStaffVC.didMove(toParent: self)
    }
}



