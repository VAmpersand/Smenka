//
//  ShiftTypeCreationView.swift
//  
//
//  Created by Viktor on 09.02.2020.
//

import UIKit

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
 
    
    var delegate: ShiftTypeCreationViewDelegate?
    
    var shiftType = ShiftType()
    var startTime = Date().getTime()
    var endTime = Date().getTime()
    var indicesSelectedColor: [Int] = []
    
    var previousSelected : IndexPath?
    var currentSelected : Int?
    
    let reuseIdentifier = "shiftTypeColorCell"
    let localeID = Locale.preferredLanguages.first
    
    
    func showShiftTypeCreationViewInController(viewController: UIViewController) {
        
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
        delegate?.pushButton()
        hidingShiftTypeCreationView()
        getShiftType()
        
        DispatchQueue.main.async {
            StorageManager.saveShiftType(self.shiftType)
        }
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

