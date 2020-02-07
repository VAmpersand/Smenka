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
        
        let staffCount = 0
        
        return staffCount
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        
        
        
        
        
        return cell
        
    }
}
