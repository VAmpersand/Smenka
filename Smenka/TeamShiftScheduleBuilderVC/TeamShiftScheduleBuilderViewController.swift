//
//  TeamShiftScheduleViewController.swift
//  Smenka
//
//  Created by Viktor on 05.03.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

class TeamShiftScheduleBuilderViewController: UIViewController {
    
    @IBOutlet var backButton: UIButton!
    @IBOutlet var addStaffButton: UIButton!
    @IBOutlet var shiftSchedalTableView: UITableView!
  
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set landscapeLeft orientaion for this VC
        appDelegate.myOrientation = .landscapeRight
        UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation")
        
        shiftSchedalTableView.delegate = self
        shiftSchedalTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setDesign()
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
        
            // Present addStaffVC
              let addStaffVC = UIStoryboard(name: "AddStaff", bundle: nil).instantiateViewController(withIdentifier: "addStaff") as! AddStaffViewController
              
              self.addChild(addStaffVC)
              addStaffVC.view.frame = self.view.frame
              self.view.addSubview(addStaffVC.view)
              addStaffVC.didMove(toParent: self)
    }
    
    func setDesign() {
        self.view.backgroundColor = Style.backgroundColor
        addStaffButton.setTitleColor(Style.buttonColor, for: .normal)
        backButton.setTitleColor(Style.buttonColor, for: .normal)

        shiftSchedalTableView.backgroundColor = Style.teamScheduleSistemColor
        shiftSchedalTableView.layer.cornerRadius = 10
        shiftSchedalTableView.separatorStyle = .none
        shiftSchedalTableView.showsVerticalScrollIndicator = false
        shiftSchedalTableView.reloadData()
 
    }
}
