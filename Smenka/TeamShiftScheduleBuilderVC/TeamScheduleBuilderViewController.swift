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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        teamScheduleView.delegate = self
        teamScheduleView.dataSource = self
        
        teamScheduleView.intercellSpacing = CGSize(width: 5, height: 5)
        teamScheduleView.backgroundColor = .clear
        teamScheduleView.register(Cell.self, forCellWithReuseIdentifier: "cellID")
        
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



