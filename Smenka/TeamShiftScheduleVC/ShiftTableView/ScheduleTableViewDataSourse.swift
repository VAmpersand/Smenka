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
        
        if indexPath.section == 0 {
            cell.staffLabel.text = "\(indexPath.row + 1)"
            cell.shiftCollectionView.backgroundColor = .red
        
            return cell
        }

                
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 {
                  return 60
              }
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
    
}
