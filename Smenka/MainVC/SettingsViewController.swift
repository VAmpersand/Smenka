//
//  SettingsViewController.swift
//  
//
//  Created by Viktor on 09.02.2020.
//

import UIKit
import RealmSwift

class SettingsViewController: UIViewController {
    
    @IBOutlet var addTypeButton: UIButton!
    @IBOutlet var shiftTypeTable: UITableView!
    @IBOutlet var blurEffect: UIVisualEffectView!
    @IBOutlet weak var shiftTypeLabel: UILabel!
    
    @IBOutlet weak var customNavigationBar: CustomNavigationBarInSettingsVC!
    
    var shiftTypes: Results<ShiftType>!
    
    var currentIndexPath: IndexPath!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shiftTypeTable.delegate = self
        shiftTypeTable.dataSource = self
        
        customNavigationBar.delegate = self
        
        shiftTypes = realm.objects(ShiftType.self)
        
        self.view.backgroundColor = Style.backgroundColor
        shiftTypeTable.backgroundColor = Style.backgroundColor
        addTypeButton.tintColor = Style.buttonColor
        shiftTypeLabel.textColor = Style.labelColor
        
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

extension SettingsViewController: ThemeChangingDelegate {
    
    func themeIsTogle() {
        
        self.view.backgroundColor = Style.backgroundColor
        shiftTypeTable.backgroundColor = Style.backgroundColor
        addTypeButton.tintColor = Style.buttonColor
        shiftTypeLabel.textColor = Style.labelColor
        shiftTypeTable.reloadData()
    }
    
}

