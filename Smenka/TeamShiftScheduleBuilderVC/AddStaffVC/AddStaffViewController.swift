//
//  AddStaffViewController.swift
//  Smenka
//
//  Created by Viktor on 25.03.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit
import RealmSwift

class AddStaffViewController: UIViewController {
    
    // Init AddStaffViewController
    class func initAddStaffViewController() -> AddStaffViewController {
        let addStaffVC = Bundle.main.loadNibNamed("AddStaff", owner: self, options: nil)![0] as! AddStaffViewController
        return addStaffVC
    }
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var contentView: UIView!
    @IBOutlet var blurEffect: UIVisualEffectView!
    @IBOutlet var labels: [UILabel]!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var surnameTextField: UITextField!
    @IBOutlet var positionTextField: UITextField!
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var saveButton: UIButton!
    
    var staffList: Results<Employee>!
    var employee = Employee()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        staffList = realm.objects(Employee.self)
        
        //Add gestureRecogniser for tapped ad screen if used UIScrollView
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(self.touch))
        recognizer.numberOfTapsRequired = 1
        recognizer.numberOfTouchesRequired = 1
        scrollView.addGestureRecognizer(recognizer)
        
        registeForKeyboardNotifications()
        setDesign()
        moveIn()
    }
    
    deinit {
        removeKeyboardNotifications()
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        moveOut()
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        employee.employeeName = nameTextField.text ?? "Employee name"
        employee.employeeSurname = surnameTextField.text ?? "Employee surname"
        employee.employeePosition = positionTextField.text ?? "Employee position"
        
        DispatchQueue.main.async {
            StorageManager.saveEmployee(self.employee)
        }
        
        moveOut()
    }
    
    // Move in animation
    func moveIn() {
        self.view.transform = CGAffineTransform(scaleX: 1.35, y: 1.35)
        self.view.alpha = 0.0
        
        UIView.animate(withDuration: 0.5) {
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            self.view.alpha = 1
            self.blurEffect.alpha = 0.9
        }
    }
    
    // Move out animation
    func moveOut() {
        UIView.animate(withDuration: 0.5, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.35, y: 1.35)
            self.view.alpha = 0
            self.blurEffect.alpha = 0
        }){ _ in
            self.view.removeFromSuperview()
        }
    }
    
    func setDesign() {
        
        saveButton.layer.cornerRadius = 4
        saveButton.setTitleColor(Style.buttonColor, for: .normal)
        
        cancelButton.layer.cornerRadius = 4
        cancelButton.setTitleColor(Style.buttonColor, for: .normal)
        
        contentView.layer.cornerRadius = 15
        contentView.backgroundColor = Style.backgroundColor
        
        nameTextField.backgroundColor = Style.textFieldColor
        surnameTextField.backgroundColor = Style.textFieldColor
        positionTextField.backgroundColor = Style.textFieldColor
        
        guard let defaultTheme = defaultThemeStyle.value(forKey: "defaultTheme") as? String else { return }
        if defaultTheme == "dark" {
            nameTextField.keyboardAppearance = .dark
            surnameTextField.keyboardAppearance = .dark
            positionTextField.keyboardAppearance = .dark
        } else {
            nameTextField.keyboardAppearance = .light
            surnameTextField.keyboardAppearance = .light
            positionTextField.keyboardAppearance = .light
            
        }
        for label in labels {
            label.textColor = Style.labelColor
        }
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
                
        scrollView.contentOffset = CGPoint(x: 0, y: (keyboardFrameSize.height - 105))
        
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
