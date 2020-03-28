//
//  TeamShiftScheduleTableViewDataSourse.swift
//  Smenka
//
//  Created by Viktor on 27.03.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

extension TeamShiftScheduleBuilderViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        } else if section == 1 {
            return 10
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamTableViewCell", for: indexPath) as! TeamShiftScheduleBuilderTableViewCell
        
        if indexPath.section == 0 {
            cell.staffLabel.text = ""
            cell.staffLabel.backgroundColor = .clear
            cell.staffLabel.layer.borderColor = (UIColor.clear).cgColor
            cell.shiftCollectionView.backgroundColor = Style.teamScheduleSistemColor
            
        } else if indexPath.section == 1 {
            cell.staffLabel.text = "Test"
            cell.staffLabel.textAlignment = .left
            cell.staffLabel.font = UIFont(name: "Helvetica neue", size: 15)
            cell.staffLabel.numberOfLines = 1
            cell.staffLabel.backgroundColor = .clear
            cell.staffLabel.layer.borderColor = (Style.labelColor).cgColor
            cell.staffLabel.backgroundColor = Style.teamScheduleSistemColor
            
        } else {
            cell.staffLabel.textAlignment = .right
            cell.staffLabel.font = UIFont(name: "Helvetica neue", size: 10)
            cell.staffLabel.numberOfLines = 2
            cell.staffLabel.text = "The number of employees"
            cell.staffLabel.backgroundColor = .clear
            cell.staffLabel.layer.borderColor = (UIColor.clear).cgColor
            cell.shiftCollectionView.backgroundColor = Style.teamScheduleSistemColor
        }
        
        cell.shiftCollectionView.layer.cornerRadius = 3
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    
}
