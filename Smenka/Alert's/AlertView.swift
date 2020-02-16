//
//  AlertView.swift
//  Smenka
//
//  Created by Viktor on 15.02.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

class AlertView: UIViewController {
    
    @IBOutlet var messageView: UIView!
    @IBOutlet var textMessageLabel: UILabel!
    @IBOutlet var okButton: UIButton!
    @IBOutlet var blurEffect: UIVisualEffectView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        okButton.layer.borderColor = (UIColor.blue).cgColor
        okButton.layer.borderWidth = 1
        okButton.layer.cornerRadius = 4
        okButton.setTitleColor(.blue, for: .normal)
        
        messageView.layer.cornerRadius = 15
        moveIn()
        
    }
    
    
    @IBAction func okButtonPressed(_ sender: Any) {
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
        }) { _ in
            self.view.removeFromSuperview()
        }
    }
}
