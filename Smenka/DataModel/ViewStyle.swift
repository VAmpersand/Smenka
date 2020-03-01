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
    static var barColor = UIColor.white
    static var barShadowColor = UIColor.black
    static var todayMarkColor = UIColor.red
    static var todayMarkColorIfSelected = UIColor.white
    static var weekdaysLabelColor = UIColor.black
    static var weekendLabelColor = UIColor.gray
    static var weekdaysLabelColorIfSelected = UIColor.white
    static var weekendLabelColorIfSelected = UIColor.white
    static var textFieldColor = UIColor.white
    static var unselectedBarItemColor = UIColor.gray
    static var selectedBarItemColor = UIColor.blue
    
    
    static func themeDark(){
        backgroundColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        labelColor = UIColor.white
        buttonColor = UIColor.blue
        barColor = UIColor.lightGray
        barShadowColor = UIColor.white
        todayMarkColor = UIColor.red
        todayMarkColorIfSelected = UIColor.white
        weekdaysLabelColor = UIColor.white
        weekendLabelColor = UIColor.gray
        weekdaysLabelColorIfSelected = UIColor.white
        weekendLabelColorIfSelected = UIColor.white
        textFieldColor = UIColor.gray
        unselectedBarItemColor = UIColor.white
        selectedBarItemColor = UIColor.blue
        
    }
    
    static func themeLight(){
        backgroundColor = UIColor.white
        labelColor = UIColor.black
        buttonColor = UIColor.blue
        barColor = UIColor.white
        barShadowColor = UIColor.black
        todayMarkColor = UIColor.red
        todayMarkColorIfSelected = UIColor.white
        weekdaysLabelColor = UIColor.black
        weekendLabelColor = UIColor.gray
        weekdaysLabelColorIfSelected = UIColor.white
        weekendLabelColorIfSelected = UIColor.white
        textFieldColor = UIColor.white
        unselectedBarItemColor = UIColor.gray
        selectedBarItemColor = UIColor.blue
    }
}
