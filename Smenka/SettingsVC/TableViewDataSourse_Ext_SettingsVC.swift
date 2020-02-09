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
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShiftTypeCell", for: indexPath) as! ShiftTypeTableViewCell
        
        cell.typeNameLabel.text = "Test name"
        cell.shiftTimeLabel.text = "From 10:00 to 19:00"
        cell.typeColor.backgroundColor = .red
        cell.typeColor.layer.cornerRadius = 20
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
}
