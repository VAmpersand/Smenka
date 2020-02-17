//
//  SettingsViewController.swift
//  
//
//  Created by Viktor on 09.02.2020.
//

import UIKit
import RealmSwift

class SettingsViewController: UIViewController {
    
    @IBOutlet var screenModeLabel: UILabel!
    @IBOutlet var screenModeSwitch: UISwitch!
    @IBOutlet var addTypeButton: UIButton!
    @IBOutlet var shiftTypeTable: UITableView!
    @IBOutlet var blurEffect: UIVisualEffectView!
    
    var shiftTypes: Results<ShiftType>!
    
    var currentIndexPath: IndexPath!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shiftTypeTable.delegate = self
        shiftTypeTable.dataSource = self
        
        shiftTypes = realm.objects(ShiftType.self)
    }
    
    @IBAction func screenModeToggle(_ sender: Any) {
        
    }
    
    @IBAction func addShiftType(_ sender: Any) {
        
        let shiftTypeCreation = ShiftTypeCreationView.initShiftTypeCreationView(delegate: self)
        shiftTypeCreation.showShiftTypeCreationViewInController(viewController: self)
        
        UIView.animate(withDuration: 1) {
            self.blurEffect.alpha = 0.9
        }
    }
}

extension SettingsViewController: ShiftTypeCreationViewDelegate {
    
    func pushButton() {
        
        UIView.animate(withDuration: 1) {
            self.blurEffect.alpha = 0
        }
        DispatchQueue.main.async {
            self.shiftTypeTable.reloadData()
        }
    }
}

extension SettingsViewController {
    
    func showMessageView() {
        let alertView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "alertView") as! AlertView 
        
        self.addChild(alertView) // 2
        alertView.view.frame = self.view.frame
        self.view.addSubview(alertView.view)
        
        alertView.didMove(toParent: self)
        
        
    }
}
