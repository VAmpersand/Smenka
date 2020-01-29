//
//  Ext_Date.swift
//  Smenka
//
//  Created by Viktor on 28.01.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import Foundation

extension Date {
    
    var weekday: Int {
        var weekday = Calendar.current.component(.weekday, from: self) - 1
        
        if weekday == 0 {
            weekday = 7
        }
        return weekday
    }
    
    var firstDayOfTheMonth: Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year,.month], from: self))!
    }
}
