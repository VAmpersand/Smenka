//
//  CustomTabBarController.swift
//  Smenka
//
//  Created by Viktor on 01.03.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       NotificationCenter.default.addObserver(self, selector: #selector(setDesign), name: NSNotification.Name(rawValue: "light"), object: nil)
        setThemeFromDefaults()
        setDesign()
    }
    
    @objc func setDesign() {
        self.tabBar.barTintColor = Style.barBackgroundColor
        self.tabBar.unselectedItemTintColor = Style.unselectedBarItemColor
        self.tabBar.tintColor =  Style.selectedBarItemColor
        self.tabBar.makeShadow()
                
    }
}

