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
        return colors.count - 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "shiftTypeColorCell", for: indexPath) as! ShiftTypeColorCollectionVCell
        
        let colorWasUsed = colorCheckForUse(indexPath: indexPath)
        if colorWasUsed {
            cell.blurEffect.alpha = 1
        }
        
        cell.colorImage.backgroundColor = colors[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ShiftTypeColorCollectionVCell
        
        // Fist choice after display ShiftTypeCreationView
        let colorWasUsed = colorCheckForUse(indexPath: indexPath)
        if colorWasUsed {          // Show animation if color was used early
            cell.blurEffect.alpha = 1
            animateChoosingColorView(colorImage: cell.colorImage, indexPath: indexPath)
        } else {
            UIView.animate(withDuration: 0.5) {
                cell.blurEffect.alpha = 1
            }
            selectedColorIndex = indexPath
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ShiftTypeColorCollectionVCell
        
        let colorWasUsed = colorCheckForUse(indexPath: indexPath)
        if colorWasUsed {
            cell.blurEffect.alpha = 1
        } else {
            UIView.animate(withDuration: 0.5) {
                cell.blurEffect.alpha = 0
            }
        }
    }
    
    // Сolor check for use
    func colorCheckForUse(indexPath: IndexPath) -> Bool {
        
        var colorWasUsed = false
        
        guard let shiftTypes = shiftTypes else { return colorWasUsed }
        for shiftTipe in shiftTypes {
            if indexPath.row == shiftTipe.shiftColorIndex {
                colorWasUsed = true
            }
        }
        return colorWasUsed
    }
    
    // Animate color view.
    func animateChoosingColorView(colorImage: UIImageView, indexPath: IndexPath) {
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseOut], animations: {
            colorImage.transform = .init(scaleX: 0.0, y: 0.0)
        }) { (finished) in
            UIView.animate(withDuration: 0.3, animations: {
                colorImage.transform = .identity
            })
        }
    }
}
