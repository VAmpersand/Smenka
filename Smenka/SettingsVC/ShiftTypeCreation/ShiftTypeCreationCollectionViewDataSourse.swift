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

    
//    func setSelected(_ selected: Bool, animated: Bool) {
//           super.setSelected(selected, animated: animated)
//       }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "shiftTypeColorCell", for: indexPath) as! ShiftTypeColorCollectionVCell
        
        cell.colorImage.backgroundColor = .red
        cell.colorImage.layer.cornerRadius = 20
        return cell
    
    }
    


}
