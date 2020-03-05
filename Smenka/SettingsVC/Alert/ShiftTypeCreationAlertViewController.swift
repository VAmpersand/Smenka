//
//  ShiftTypeCreationAlertViewController.swift
//  Smenka
//
//  Created by Viktor on 04.03.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit
import RealmSwift

class ShiftTypeCreationAlertViewController: UIViewController {
    
    class func initShiftTypeCreationAlertViewController() ->  ShiftTypeCreationAlertViewController {
        let shiftTypeCreationAlert = Bundle.main.loadNibNamed("ShiftTypeCreationAlert", owner: self, options: nil)![0] as! ShiftTypeCreationAlertViewController
        return shiftTypeCreationAlert
    }
    
    @IBOutlet var messageView: UIView!
    @IBOutlet var textMessageLabel: UILabel!
    @IBOutlet var okButton: UIButton!
    @IBOutlet var blurEffect: UIVisualEffectView!
    
    var themeChangingDelegate = CustomNavigationBarInSettingsVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        okButton.layer.cornerRadius = 4
        okButton.setTitleColor(Style.buttonColor, for: .normal)
        
        messageView.layer.cornerRadius = 15
        
        messageView.backgroundColor = Style.backgroundColor
        textMessageLabel.textColor = Style.labelColor
        okButton.setTitleColor(Style.buttonColor, for: .normal)
        moveIn()
    }
    
    @IBAction func okButtonPressed(_ sender: Any) {
        moveOut()
    }
    
    //MARK: Move in alert animation
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
}
