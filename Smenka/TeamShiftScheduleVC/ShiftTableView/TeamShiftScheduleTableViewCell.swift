//
//  TeamShiftScheduleTableViewCell.swift
//  Smenka
//
//  Created by Viktor on 11.03.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

class TeamShiftScheduleTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var staffLabel: UILabel!
    @IBOutlet var shiftCollectionView: UICollectionView!
    
    var points: CGPoint!
    
    let teamShiftSchedulVC = TeamShiftScheduleViewController()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        shiftCollectionView.delegate = self
        shiftCollectionView.dataSource = self
        setDesign()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        31
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "shiftTypeCell", for: indexPath) as! ShiftDataCollectionViewCell
        
        //        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(scrollCalendar))
        //        cell.addGestureRecognizer(panGestureRecognizer)
        cell.setDesign()
        
        cell.shiftTypeLabel.text = ""
        
        
        return cell
    }
    
    //    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    //
    //    }
    
    
    func setDesign() {
        staffLabel.layer.cornerRadius = 3
        staffLabel.layer.borderColor = (Style.teamScheduleBorderColor).cgColor
        staffLabel.layer.borderWidth = 1
        staffLabel.clipsToBounds = true
        staffLabel.backgroundColor = Style.teamScheduleSistemColor
        staffLabel.textColor = Style.labelColor
        
        shiftCollectionView.showsHorizontalScrollIndicator = false
        shiftCollectionView.backgroundColor = .clear
        backgroundColor = .clear
        
        shiftCollectionView.reloadData()
    }
    
//    @objc func scrollCalendar(recognizer: UIPanGestureRecognizer) {
//        
//        if recognizer.state == .began {
//            print("Gesture began")
//        } else if recognizer.state == .changed {
//            
//            let translation = recognizer.translation(in: shiftCollectionView)
//            
//        } else if recognizer.state == .ended {
//            
//        }
//    }
}

