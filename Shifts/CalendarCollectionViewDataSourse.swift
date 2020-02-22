//
//  CalendarCollectionViewDataSourse.swift
//  Shifts
//
//  Created by Viktor on 21.02.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

extension TodayViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 36
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CalendarCollectionViewCell
        
        cell.cellView.layer.cornerRadius = cell.bounds.width / 2
        cell.cellLabel.text = "\(indexPath.row)"
     
        return cell
    }

}
