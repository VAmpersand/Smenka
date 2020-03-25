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
    static var barBackgroundColor = UIColor.white
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
    static var teamScheduleSistemColor = UIColor.lightGray
    static var teamScheduleCalendarDefaultColor = UIColor.gray
    static var teamScheduleBorderColor = UIColor.darkGray
    
    
    static func themeDark(){
        backgroundColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        labelColor = .white
        buttonColor = .blue
        barBackgroundColor = .lightGray
        barShadowColor = .white
        todayMarkColor = .red
        todayMarkColorIfSelected = .white
        weekdaysLabelColor = .white
        weekendLabelColor = .gray
        weekdaysLabelColorIfSelected = .white
        weekendLabelColorIfSelected = .white
        textFieldColor = .gray
        unselectedBarItemColor = .white
        selectedBarItemColor = .blue
        teamScheduleSistemColor = .gray
        teamScheduleCalendarDefaultColor = .gray
        teamScheduleBorderColor = .white
    }
    
    static func themeLight(){
        backgroundColor = .white
        labelColor = .black
        buttonColor = .blue
        barBackgroundColor = .white
        barShadowColor = .black
        todayMarkColor = .red
        todayMarkColorIfSelected = .white
        weekdaysLabelColor = .black
        weekendLabelColor = .gray
        weekdaysLabelColorIfSelected = .white
        weekendLabelColorIfSelected = .white
        textFieldColor = .white
        unselectedBarItemColor = .gray
        selectedBarItemColor = .blue
        teamScheduleSistemColor = .lightGray
        teamScheduleCalendarDefaultColor = .gray
        teamScheduleBorderColor = .darkGray
        
    }
}
