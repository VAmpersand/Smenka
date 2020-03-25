//
//  AddStaffViewController.swift
//  Smenka
//
//  Created by Viktor on 25.03.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

class AddStaffViewController: UIViewController {
    
    class func initclassAddStaffViewController() -> AddStaffViewController {
        let addStaffViewController = Bundle.main.loadNibNamed("AddStaff", owner: self, options: nil)![0] as! AddStaffViewController
        return addStaffViewController
    }
    
    
    
    @IBOutlet var contentView: UIView!
    @IBOutlet var blurEffect: UIVisualEffectView!
    @IBOutlet var labels: [UILabel]!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var surnameTextField: UITextField!
    @IBOutlet var positionTextField: UITextField!
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDesign()
        moveIn()
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        moveOut()
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        moveOut()
    }
    
    func moveIn() {
        self.view.transform = CGAffineTransform(scaleX: 1.35, y: 1.35)
        self.view.alpha = 0.0
        
        UIView.animate(withDuration: 0.5) {
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            self.view.alpha = 1
            self.blurEffect.alpha = 0.9
        }
    }
    
    //MARK: Move out alert animation
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
        
        for label in labels {
            label.textColor = Style.labelColor
        }
    }
    
}
