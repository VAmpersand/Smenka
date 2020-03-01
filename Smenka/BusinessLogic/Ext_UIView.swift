//
//  Ext_UIView.swift
//  Smenka
//
//  Created by Viktor on 28.02.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

extension UIView {
    
    func makeShadow() {
        self.layer.shadowColor = (Style.barShadowColor).cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 2
    }
    
}



