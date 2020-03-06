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
        
        if shiftTypes.count == 19 {
            showMessageView(text: "You have created a limit on the number of shifts. Remove unused.")
        } else {
            let shiftTypeCreation = ShiftTypeCreationView.initShiftTypeCreationView(delegate: self)
            shiftTypeCreation.showShiftTypeCreationViewInController(viewController: self)
            UIView.animate(withDuration: 1) {
                self.blurEffect.alpha = 0.9
            }
        }
    }
    
    //MARK: Show view with reminder to create too many shift types
    func showMessageView(text: String) {
        
        let alertView = UIStoryboard(name: "ShiftTypeCreationAlert", bundle: nil).instantiateViewController(withIdentifier: "alertView") as! ShiftTypeCreationAlertViewController
        
        self.addChild(alertView)
        alertView.view.frame = self.view.frame
        self.view.addSubview(alertView.view)
        alertView.didMove(toParent: self)
        alertView.textMessageLabel.text = text
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

