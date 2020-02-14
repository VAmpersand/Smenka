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
    
    //MARK: Get time for present in shiftTypeTable with rounded to 15 minute
    func getRoundedTime() -> String{
        
        var minute = 0
        var hour = 0
        
        var minuteInt = 0
        var time = ""
        
        let minuteFormatter = DateFormatter()
        minuteFormatter.dateFormat = "mm"
        let minuteStr = minuteFormatter.string(from: self as Date)

        let hourFormatter = DateFormatter()
        hourFormatter.dateFormat = "HH"
        let hourStr = hourFormatter.string(from: self as Date)
        
        let minuteIntOpt: Int?  = Int(minuteStr)
        if minuteIntOpt != nil {
            minuteInt = minuteIntOpt ?? 0
        }
        
        let hourIntOpt: Int? = Int(hourStr)
        if hourIntOpt != nil {
            hour = hourIntOpt ?? 0
        }
        
        let remainderMinute = minuteInt % 15
        let roundedMinute = Int(minuteInt / 15)

        if remainderMinute < 8 {
            minute = roundedMinute * 15
        } else if remainderMinute >= 8 {
            if roundedMinute == 3 {
                hour += 1
            }
            if roundedMinute == 0 {
               minute = 15
            }
        }
        
        if minute == 0{
            time = "\(hour)-00"
        } else {
            time = "\(hour)-\(minute)"
        }
        return time
    }
}
