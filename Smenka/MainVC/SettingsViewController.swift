//
//  SettingsViewController.swift
//  
//
//  Created by Viktor on 09.02.2020.
//

import UIKit
import RealmSwift

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var screenModeLabel: UILabel!
    @IBOutlet weak var screenModeSwitch: UISwitch!
    @IBOutlet weak var addTypeButton: UIButton!
    @IBOutlet weak var shiftTypeTable: UITableView!
    @IBOutlet weak var blurEffect: UIVisualEffectView!
    
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
