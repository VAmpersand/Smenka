//
//  MainViewController.swift
//  Smenka
//
//  Created by Viktor on 21.01.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    

    @IBOutlet var Calendar: UICollectionView!
    @IBOutlet  var MonthLabel: UILabel!
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func Next(_ sender: Any) {
    }
    
    @IBAction func Back(_ sender: Any) {
    }
    

}

