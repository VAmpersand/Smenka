//
//  TrailingSwipeAction.swift
//  Smenka
//
//  Created by Viktor on 12.02.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

extension SettingsViewController  {
    
    func editingShiftType(at indexPath: IndexPath) -> UIContextualAction {
        let button = UIContextualAction(style: .normal, title: "Editing") { (_, action, completion) in
            
            let shiftTypeCreation = ShiftTypeCreationView.initShiftTypeCreationView(delegate: self)
            shiftTypeCreation.showShiftTypeCreationViewInController(viewController: self)
            shiftTypeCreation.indexEditableType = indexPath.row
            
            let shiftType = self.shiftTypes[indexPath.row]
            
            // Set shift type parametr's when editing
            shiftTypeCreation.typeNameTextField.text = shiftType.shiftTypeName
            shiftTypeCreation.startTimePicker.setDate(shiftType.startTime.timeStr!, animated: false)
            shiftTypeCreation.endTimePicker.setDate(shiftType.endTime.timeStr!, animated: false)
            
            UIView.animate(withDuration: 1) {
                self.blurEffect.alpha = 0.9
            }
            
            completion(true)
        }
        button.backgroundColor = .gray
        return button
    }
    
    func deleteShiftType(at indexPath: IndexPath) -> UIContextualAction {
        let button = UIContextualAction(style: .destructive , title: "Delete") { (_, action, completion) in
            
            DispatchQueue.main.async {
                StorageManager.removeShiftType(self.shiftTypes[indexPath.row])
                self.shiftTypeTable.deleteRows(at: [indexPath], with: .automatic)
            }
            
            completion(true)
        }
        button.backgroundColor = .red
        return button
    }
}
