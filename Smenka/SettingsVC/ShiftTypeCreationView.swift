//
//  ShiftTypeCreationView.swift
//  
//
//  Created by Viktor on 09.02.2020.
//

import UIKit
import RealmSwift

protocol ShiftTypeCreationViewDelegate {
    func pushButton()
}


class ShiftTypeCreationView: UIView {
    
    class func initShiftTypeCreationView(delegate:  ShiftTypeCreationViewDelegate) ->  ShiftTypeCreationView {
        let shiftTypeCreation = Bundle.main.loadNibNamed("ShiftTypeCreationView", owner: self, options: nil)![0] as! ShiftTypeCreationView
        shiftTypeCreation.delegate = delegate
        return shiftTypeCreation
    }
    
    @IBOutlet weak var typeNameTextField: UITextField!
    @IBOutlet weak var startTimePicker: UIDatePicker!
    @IBOutlet weak var endTimePicker: UIDatePicker!
    @IBOutlet weak var shiftColorCollectionView: UICollectionView!
    @IBOutlet weak var cancelBatton: UIButton!
    @IBOutlet weak var saveBatton: UIButton!
    
    let settingsVC = SettingsViewController()
    var delegate: ShiftTypeCreationViewDelegate?
    var shiftTypes: Results<ShiftType>!
    
    var shiftType = ShiftType()
    var startTime = Date().getTime()
    var endTime = Date().getTime()
    
    //    var indicesSelectedColor: [Int] = []
    
    var indexEditableType: IndexPath!
    
    let reuseIdentifier = "shiftTypeColorCell"
    let localeID = Locale.preferredLanguages.first
    
    //MARK: ShiftTypeCreationView display function
    func showShiftTypeCreationViewInController(viewController: UIViewController) {
        
        shiftTypes = realm.objects(ShiftType.self)
        
        startTimePicker.datePickerMode = .time
        endTimePicker.datePickerMode = .time
        
        startTimePicker.locale = Locale(identifier: localeID!)
        endTimePicker.locale = Locale(identifier: localeID!)
        
        startTimePicker.addTarget(self, action: #selector(getStartTime), for: .valueChanged)
        endTimePicker.addTarget(self, action: #selector(getEndTime), for: .valueChanged)
        
        self.frame.origin.x = (viewController.view.frame.width - 360) / 2
        self.frame.origin.y = viewController.view.frame.height
        self.layer.cornerRadius = 15
        
        UIView.animate(withDuration: 0.6, animations: {
            self.frame.origin.y = 85
        })
        
        viewController.view.addSubview(self)
    }
    
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        delegate?.pushButton()
        hidingShiftTypeCreationView()
    }
    
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        hidingShiftTypeCreationView()
        getShiftType()
        
        //MARK: Сhoose to save new or overwrite editable
        if indexEditableType != nil {
            DispatchQueue.main.async {
                StorageManager.editShiftType(self.shiftTypes[self.indexEditableType.row], self.shiftType)
            }
        } else {
            DispatchQueue.main.async {
                StorageManager.saveShiftType(self.shiftType)
            }
        }
        delegate?.pushButton()
    }
}


extension ShiftTypeCreationView {
    
    // Hiding animation for ShiftTypeCreationView
    func hidingShiftTypeCreationView() {
        self.frame.origin.y = 85
        self.layer.cornerRadius = 15
        
        UIView.animate(withDuration: 0.6, animations: {
            self.frame.origin.y = (self.delegate as! UIViewController).view.frame.height
        }) { (bool) in
            self.removeFromSuperview()
        }
    }
    
    func getShiftType() {
        shiftType.shiftTypeName = typeNameTextField.text ?? "Default value"
        shiftType.startTime = startTime
        shiftType.endTime = endTime
    }
    
    @objc func getStartTime() {
        startTime = startTimePicker.date.getTime()
    }
    
    @objc func getEndTime() {
        endTime = endTimePicker.date.getTime()
    }
}

