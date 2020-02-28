//
//  ViewStyle.swift
//  Smenka
//
//  Created by Viktor on 25.02.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

enum ThemeStyle {
    case light
    case dark
}


struct Style {
    static var backgroundColor = UIColor.white
    static var labelColor = UIColor.black
    static var buttonColor = UIColor.blue
    static var burColor = UIColor.white
    static var burShadowColor = UIColor.gray
    static var todayMarkColor = UIColor.red
    static var todayMarkColorIfSelected = UIColor.white
    static var weekdaysLabelColor = UIColor.black
    static var weekendLabelColor = UIColor.gray
    
    static func themeDark(){
        backgroundColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        labelColor = UIColor.white
        buttonColor = UIColor.blue
        burColor = UIColor.lightGray
        burShadowColor = UIColor.gray
        todayMarkColor = UIColor.red
        todayMarkColorIfSelected = UIColor.black
        weekdaysLabelColor = UIColor.white
        weekendLabelColor = UIColor.gray
    }
    
    static func themeLight(){
        backgroundColor = UIColor.white
        labelColor = UIColor.black
        buttonColor = UIColor.blue
        burColor = UIColor.white
        burShadowColor = UIColor.gray
        todayMarkColor = UIColor.red
        todayMarkColorIfSelected = UIColor.white
        weekdaysLabelColor = UIColor.black
        weekendLabelColor = UIColor.gray
        
    }
}
