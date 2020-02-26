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
   func okButtonPressedWhenDeleting()
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
        
        okButton.layer.cornerRadius = 4
        okButton.setTitleColor(#colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1), for: .normal)
        
        cancelButton.layer.cornerRadius = 4
        cancelButton.setTitleColor(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), for: .normal)
        
        messageView.layer.cornerRadius = 15
        moveIn()
        
    }
    
    @IBAction func okButtonPressed(_ sender: Any) {
        delegate?.okButtonPressedWhenDeleting()
        moveOut()
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
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
