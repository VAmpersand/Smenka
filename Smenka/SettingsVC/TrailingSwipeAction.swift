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
            
            let shiftTypeCreationVC = UIStoryboard(name: "ShiftTypeCreation", bundle: nil).instantiateViewController(withIdentifier: "shiftTypeCreation") as! ShiftTypeCreationVC
            
            shiftTypeCreationVC.delegate = self
            
            self.addChild(shiftTypeCreationVC)
            shiftTypeCreationVC.view.frame = self.view.frame
            self.view.addSubview(shiftTypeCreationVC.view)
            shiftTypeCreationVC.didMove(toParent: self)
            
            shiftTypeCreationVC.indexEditableType = indexPath
      
            let shiftType = self.shiftTypes[indexPath.row]
            
            // Set shift type parametr's when editing
            shiftTypeCreationVC.typeNameTextField.text = shiftType.shiftTypeName
            shiftTypeCreationVC.startTimePicker.setDate(shiftType.startTime.roundedTimeStr!, animated: false)
            shiftTypeCreationVC.endTimePicker.setDate(shiftType.endTime.roundedTimeStr!, animated: false)
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
