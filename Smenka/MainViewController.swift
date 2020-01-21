//
//  MainViewController.swift
//  Smenka
//
//  Created by Viktor on 21.01.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var Calendar: UICollectionView!
    @IBOutlet  var MonthLabel: UILabel!
    
    var currentMonth = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentMonth = months[month]
        
    }
    
    
    
    
    @IBAction func Next(_ sender: Any) {
    }
    
    @IBAction func Back(_ sender: Any) {
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
}

