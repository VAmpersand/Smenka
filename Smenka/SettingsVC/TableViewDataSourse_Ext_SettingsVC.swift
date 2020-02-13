//
//  TableViewDataSourse_Ext_SettingsVC.swift
//  Smenka
//
//  Created by Viktor on 09.02.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let shiftTypes = shiftTypes else { return 0 }
        return shiftTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShiftTypeCell", for: indexPath) as! ShiftTypeTableViewCell
        
        guard let shiftTypes = shiftTypes else { return cell }
        let shiftType = shiftTypes[indexPath.row]
        
        if shiftType.shiftTypeName == "" {
           cell.typeNameLabel.text = "From \(shiftType.startTime) to \(shiftType.endTime)"
           cell.shiftTimeLabel.isHidden = true
        } else {
            cell.typeNameLabel.text = shiftType.shiftTypeName
            cell.shiftTimeLabel.text = "From \(shiftType.startTime) to \(shiftType.endTime)"
            cell.shiftTimeLabel.isHidden = false
        }
        cell.typeColor.backgroundColor = colors[shiftType.shiftColorIndex]
        cell.typeColor.layer.cornerRadius = 20
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
          
          let editing = editingShiftType(at: indexPath)
          let delete = deleteShiftType(at: indexPath)
          
          return UISwipeActionsConfiguration(actions: [delete, editing])
      }

}
