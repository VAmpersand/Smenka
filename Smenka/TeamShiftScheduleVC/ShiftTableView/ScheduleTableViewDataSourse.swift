//
//  ScheduleTableViewDataSourse.swift
//  Smenka
//
//  Created by Viktor on 10.03.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

extension TeamShiftScheduleViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return 1
        }
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! TeamShiftScheduleTableViewCell
        
        cell.setDesign()
        
        if indexPath.section == 0 {
            cell.staffLabel.text = ""
        
            return cell
        }
        
        cell.staffLabel.textAlignment = .right
        cell.staffLabel.font = UIFont(name: "Helvetica neue", size: 13)
        cell.staffLabel.numberOfLines = 2
        cell.staffLabel.text = "The number of employees"
        cell.staffLabel.backgroundColor = .clear
        cell.staffLabel.layer.borderColor = (UIColor.clear).cgColor
        
        cell.shiftCollectionView.backgroundColor = Style.teamScheduleSistemColor
        cell.shiftCollectionView.layer.cornerRadius = 3

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 0
        }
        return 8
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
