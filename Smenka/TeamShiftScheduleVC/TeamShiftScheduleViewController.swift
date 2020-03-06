//
//  TeamShiftScheduleViewController.swift
//  Smenka
//
//  Created by Viktor on 05.03.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

class TeamShiftScheduleViewController: UIViewController {
    
    let appDel = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDel.myOrientation = .landscape
        UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation")
        
    }
    

    
    func canRotate() -> Void {}


    @IBAction func didDismissButtonPress(sender: UIButton) {
        self.dismiss(animated: true) { () -> Void in
            self.appDel.myOrientation = .portrait
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
           }
       }

    
}
