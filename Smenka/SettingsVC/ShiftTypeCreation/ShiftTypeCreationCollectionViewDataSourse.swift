//
//  ShiftTypeCreationCollectionVC.swift
//  Smenka
//
//  Created by Viktor on 10.02.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

extension ShiftTypeCreationView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        shiftColorCollectionView.delegate = self
        shiftColorCollectionView.dataSource = self
        shiftColorCollectionView.register(UINib.init(nibName: "ShiftTypeColorCollectionVCell", bundle: nil), forCellWithReuseIdentifier: "shiftTypeColorCell")
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "shiftTypeColorCell", for: indexPath) as! ShiftTypeColorCollectionVCell
        cell.colorImage.backgroundColor = colors[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ShiftTypeColorCollectionVCell
        
        UIView.animate(withDuration: 1) {
            cell.blurEffect.alpha = 1
        }
        cell.colorImage.layer.borderWidth = 2
        cell.colorImage.layer.borderColor = (UIColor.black).cgColor
        
        shiftType.shiftColorIndex = indexPath.row
    }
    
    
}
