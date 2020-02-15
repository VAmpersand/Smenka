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
    
    
    var delegate: ShiftTypeCreationViewDelegate?
    var shiftTypes: Results<ShiftType>!
    
    var shiftType = ShiftType()
    
    var startTime: String!
    var endTime: String!
    var indexEditableType: IndexPath!  // Editing сheck
    var selectedColorIndex: IndexPath! // Checking color selection
    
    //    var indicesSelectedColor: [Int] = []
    
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
        hidingShiftTypeCreationView()
    }
}


extension ShiftTypeCreationView {
    
    //MARK: Hiding animation for ShiftTypeCreationView
    func hidingShiftTypeCreationView() {
        self.frame.origin.y = 85
        self.layer.cornerRadius = 15
        
        UIView.animate(withDuration: 0.6, animations: {
            self.frame.origin.y = (self.delegate as! UIViewController).view.frame.height
        }) { (bool) in
            self.removeFromSuperview()
        }
    }
    
    //MARK: Geting shiftType item
    func getShiftType() {
        shiftType.shiftTypeName = typeNameTextField.text ?? ""
        
        if selectedColorIndex != nil {          // Color was select
            shiftType.shiftColorIndex = selectedColorIndex.row
        } else if indexEditableType != nil {    // If editing
            shiftType.shiftColorIndex = shiftTypes[indexEditableType.row].shiftColorIndex
        } else {                                // If creation new item
            shiftType.shiftColorIndex = getColor()
        }
        
        if startTime != nil {                   // Picker use
            shiftType.startTime = startTime
        } else if indexEditableType != nil {    // If editing
            shiftType.startTime = shiftTypes[indexEditableType.row].startTime
        } else {                                // If creation new item
            shiftType.startTime = Date().getRoundedTime()
        }
        
        if endTime != nil {                     // Picker use
            shiftType.endTime = endTime
        } else if indexEditableType != nil {    // If editing
            shiftType.endTime = shiftTypes[indexEditableType.row].endTime
        } else {                                // If creation new item
            shiftType.endTime = Date().getRoundedTime()
        }
        
    }
    
    @objc func getStartTime() {
        startTime = startTimePicker.date.getRoundedTime()
    }
    
    @objc func getEndTime() {
        endTime = endTimePicker.date.getRoundedTime()
    }
    
    //MARK: Consistent setting of free colors
    func getColor() -> Int! {
        
        var indexesIsMatch: [Bool] = []
        var setColorIndex = 0
        
        for _ in 0..<colors.count - 1 {
            indexesIsMatch.append(false)
        }
        
        guard let shiftTypes = shiftTypes else { return setColorIndex }
        for shiftTipe in shiftTypes {
            indexesIsMatch[shiftTipe.shiftColorIndex] = true
        }
        
        setColorIndex = indexesIsMatch.firstIndex(of: false) ?? 0
        return setColorIndex
    }
}

