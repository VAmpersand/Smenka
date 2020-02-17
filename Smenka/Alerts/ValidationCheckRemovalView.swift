//
//  ValidationCheckRemovalView.swift
//  Smenka
//
//  Created by Viktor on 15.02.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit
import RealmSwift

protocol  ButtonDelegate {
   func okButtonPressed()
}

class ValidationCheckRemovalView: UIViewController {
        
    @IBOutlet var messageView: UIView!
    @IBOutlet var textMessageLabel: UILabel!
    @IBOutlet var okButton: UIButton!
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var blurEffect: UIVisualEffectView!
    
    var delegate: ButtonDelegate?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        okButton.layer.borderColor = (#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)).cgColor
        okButton.layer.borderWidth = 1
        okButton.layer.cornerRadius = 4
        okButton.setTitleColor(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), for: .normal)
        
        
        cancelButton.layer.borderColor = (#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)).cgColor
        cancelButton.layer.borderWidth = 1
        cancelButton.layer.cornerRadius = 4
        cancelButton.setTitleColor(#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), for: .normal)
        
        messageView.layer.cornerRadius = 15
        moveIn()
        
    }
    
    @IBAction func okButtonPressed(_ sender: Any) {
        delegate?.okButtonPressed()
        moveOut()
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
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
