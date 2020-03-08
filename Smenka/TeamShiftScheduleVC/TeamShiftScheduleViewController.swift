//
//  TeamShiftScheduleViewController.swift
//  Smenka
//
//  Created by Viktor on 07.03.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

class TeamShiftScheduleViewController: UIViewController {

    @IBOutlet var customNavigationBar: CustomNavigationBarTeamShSchV!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customNavigationBar.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        customNavigationBar.setDesign()
    }
    
}


extension TeamShiftScheduleViewController: PresentShiftScheduleBuilderDelegate {
  
    
    func editButtonPressed() {
         performSegue(withIdentifier: "segueToShSchBuilder", sender: self)
    }
    
    
    
    
}
