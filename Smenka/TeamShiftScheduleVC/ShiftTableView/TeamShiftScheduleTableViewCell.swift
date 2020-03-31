//
//  TeamShiftScheduleTableViewCell.swift
//  Smenka
//
//  Created by Viktor on 11.03.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

//class TeamShiftScheduleTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
//    
//    @IBOutlet var staffLabel: UILabel!
//    @IBOutlet var shiftCollectionView: UICollectionView!
//    
//    let teamShiftSchedulVC = TeamShiftScheduleViewController()
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        shiftCollectionView.delegate = self
//        shiftCollectionView.dataSource = self
//        setDesign()
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        31
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "shiftTypeCell", for: indexPath) as! ShiftDataCollectionViewCell
//
//        cell.setDesign()
//        cell.shiftTypeLabel.text = ""
//        
//        return cell
//    }
//    
//    func setDesign() {
//        staffLabel.layer.cornerRadius = 3
//        staffLabel.layer.borderColor = (Style.teamScheduleBorderColor).cgColor
//        staffLabel.layer.borderWidth = 1
//        staffLabel.clipsToBounds = true
//        staffLabel.backgroundColor = Style.teamScheduleSistemColor
//        staffLabel.textColor = Style.labelColor
//        
//        shiftCollectionView.showsHorizontalScrollIndicator = false
//        shiftCollectionView.backgroundColor = .clear
//        backgroundColor = .clear
//        
//        shiftCollectionView.reloadData()
//    }
//}

