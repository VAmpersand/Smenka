//
//  ShiftTypeCreationView.swift
//  
//
//  Created by Viktor on 09.02.2020.
//

import UIKit

protocol ShiftTypeCreationViewDelegate {
    func pushButton(shiftTypeCreationView: ShiftTypeCreationView)
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
    
    let reuseIdentifier = "shiftTypeColorCell"
    
    var delegate: ShiftTypeCreationViewDelegate?
    
    func showShiftTypeCreationViewInController(viewController: UIViewController) {
        
        startTimePicker.datePickerMode = .time
        endTimePicker.datePickerMode = .time
        
        viewController.view.addSubview(self)
        
        self.frame.origin.x = (viewController.view.frame.width - 360) / 2
        self.frame.origin.y = viewController.view.frame.height
        self.layer.cornerRadius = 15
        
        UIView.animate(withDuration: 0.6, animations: {
            self.frame.origin.y = 85
        })
    }
    
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        
        delegate?.pushButton(shiftTypeCreationView: self)
        hidingShiftTypeCreationView()
    }
    
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        delegate?.pushButton(shiftTypeCreationView: self)
        hidingShiftTypeCreationView()
    }
    
}


extension ShiftTypeCreationView {
    
    func hidingShiftTypeCreationView() {
        self.frame.origin.y = 85
        self.layer.cornerRadius = 15
        
        UIView.animate(withDuration: 0.6, animations: {
            self.frame.origin.y = (self.delegate as! UIViewController).view.frame.height
        }) { (bool) in
            self.removeFromSuperview()
        }
    }
    
}
