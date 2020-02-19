//
//  TableViewDataSourse_Ext_MainVC.swift
//  Smenka
//
//  Created by Viktor on 07.02.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let shiftTypes = shiftTypes else { return 0 }
        return shiftTypes.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ShiftTypeCell
        
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
        var height: CGFloat = 50
        
        guard let shiftTypes = shiftTypes else { return height }
        let shiftType = shiftTypes[indexPath.row]
        if shiftType.shiftTypeName == "Clear shift type" {
            height = 0
        }
        return height
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


