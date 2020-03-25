//
//  TeamShiftScheduleViewController.swift
//  Smenka
//
//  Created by Viktor on 05.03.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

class TeamShiftScheduleBuilderViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var addStaffButton: UIButton!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set landscapeLeft orientaion for this VC
        appDelegate.myOrientation = .landscapeRight
        UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation")
        
    }
    
    //MARK: Return to portrait orientation
    @IBAction func didDismissButtonPress(sender: UIButton) {
        self.dismiss(animated: true) { () -> Void in
            
            // Set portrait orientaion for this VC
            self.appDelegate.myOrientation = .portrait
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        }
    }
    
    @IBAction func addStaffButtonPressed(_ sender: Any) {
        
    }
    
    
    
}
