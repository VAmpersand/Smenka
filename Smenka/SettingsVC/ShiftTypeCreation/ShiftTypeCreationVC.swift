//
//  ShiftTypeCreationVC.swift
//  Smenka
//
//  Created by Viktor on 26.03.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit
import RealmSwift

protocol ShiftTypeCreationVCDelegate {
    func pushButton()
}

class ShiftTypeCreationVC: UIViewController, UIGestureRecognizerDelegate {
    
    // Init ShiftTypeCreationViewController
    class func initShiftTypeCreationViewController() -> ShiftTypeCreationVC {
        let shiftTypeCreationVC = Bundle.main.loadNibNamed("ShiftTypeCreation", owner: self, options: nil)![0] as! ShiftTypeCreationVC
        return shiftTypeCreationVC
    }
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var blurEffect: UIVisualEffectView!
    @IBOutlet var contentView: UIView!
    @IBOutlet var labels: [UILabel]!
    @IBOutlet var typeNameTextField: UITextField!
    @IBOutlet var startTimePicker: UIDatePicker!
    @IBOutlet var endTimePicker: UIDatePicker!
    @IBOutlet var shiftColorCollectionView: UICollectionView!
    @IBOutlet var cancelBatton: UIButton!
    @IBOutlet var saveBatton: UIButton!
    
    var delegate: ShiftTypeCreationVCDelegate?
    
    var shiftTypes: Results<ShiftType>!
    var shiftType = ShiftType()
    
    var startTime: String!
    var endTime: String!
    var indexEditableType: IndexPath!  // Editing сheck
    var selectedColorIndex: IndexPath! // Checking color selection
    var recognizer: UITapGestureRecognizer!
    
    let reuseIdentifier = "typeColorCell"
    let localeID = Locale.preferredLanguages.first
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shiftTypes = realm.objects(ShiftType.self)
        
        shiftColorCollectionView.delegate = self
        shiftColorCollectionView.dataSource = self
        
        typeNameTextField.addTarget(self, action: #selector(editingBegan), for: .editingDidBegin)
        typeNameTextField.addTarget(self, action: #selector(editingEnded), for: .editingDidEnd)
        
        registeForKeyboardNotifications()
        setDesign()
        moveIn()
    }
    
    deinit {
        removeKeyboardNotifications()
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        delegate?.pushButton()
        moveOut()
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        getShiftType()
        
        //Сhoose to save new or overwrite editable
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
        moveOut()
    }
    
    // ShiftTypeCreationView display function
    func moveIn() {
        
        self.view.transform = CGAffineTransform(scaleX: 1.35, y: 1.35)
        self.view.alpha = 0.0
        
        UIView.animate(withDuration: 0.6, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.view.alpha = 1
            self.blurEffect.alpha = 0.9
        })
    }
    
    //Hiding animation for ShiftTypeCreationView
    func moveOut() {
        UIView.animate(withDuration: 0.5, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.35, y: 1.35)
            self.view.alpha = 0
            self.blurEffect.alpha = 0
        }){ _ in
            self.view.removeFromSuperview()
        }
    }
    
    //Geting shiftType item
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
    
    //Setting the first free color if the color was not manually selected
    func getColor() -> Int! {
        
        var indexesIsMatch: [Bool] = []
        var setColorIndex = 0
        
        for _ in 0..<colors.count {
            indexesIsMatch.append(false)
        }
        
        guard let shiftTypes = shiftTypes else { return setColorIndex }
        for shiftTipe in shiftTypes {
            indexesIsMatch[shiftTipe.shiftColorIndex] = true
        }
        
        setColorIndex = indexesIsMatch.firstIndex(of: false) ?? 0
        return setColorIndex
    }
    
    func setDesign() {
        
        startTimePicker.datePickerMode = .time
        endTimePicker.datePickerMode = .time
        
        startTimePicker.locale = Locale(identifier: localeID!)
        endTimePicker.locale = Locale(identifier: localeID!)
        
        startTimePicker.addTarget(self, action: #selector(getStartTime), for: .valueChanged)
        endTimePicker.addTarget(self, action: #selector(getEndTime), for: .valueChanged)
        
        contentView.backgroundColor = Style.backgroundColor
        contentView.layer.cornerRadius = 15
        shiftColorCollectionView.backgroundColor = Style.backgroundColor
        
        startTimePicker.setValue(Style.labelColor, forKey: "textColor")
        endTimePicker.setValue(Style.labelColor, forKey: "textColor")
        
        typeNameTextField.backgroundColor = Style.barBackgroundColor
        
        for label in labels {
            label.textColor = Style.labelColor
        }
        
        guard let defaultTheme = defaultThemeStyle.value(forKey: "defaultTheme") as? String else { return }
        
        if defaultTheme == "dark" {
            typeNameTextField.keyboardAppearance = .dark
        }
        
    }
    
    //Add gestureRecogniser for tapped ad screen if used UIScrollView
    @objc func editingBegan(tapGestureRecognizer: UITapGestureRecognizer) {
        recognizer = UITapGestureRecognizer(target: self, action: #selector(self.touch))
        recognizer.numberOfTapsRequired = 1
        recognizer.numberOfTouchesRequired = 1
        scrollView.addGestureRecognizer(recognizer)
    }
    
    //Disable gesture recogniser after first tapped by screen
    @objc func editingEnded() {
        recognizer.isEnabled = false
    }
    
    //Hide keyboard by click on screen
    @objc func touch() {
        self.view.endEditing(true)
    }
    
    //Add observer at the showing and hiding of the keyboard
    private func registeForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        let userInfo = notification.userInfo
        let keyboardFrameSize = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        scrollView.contentOffset = CGPoint(x: 0, y: (keyboardFrameSize.height - 190))
    }
    
    @objc func keyboardWillHide() {
        scrollView.contentOffset = CGPoint.zero
    }
    
    //Remove observer
    private func removeKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}
