//
//  GetWeekdaysArrayForMonth.swift
//  Smenka
//
//  Created by Viktor on 29.03.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

//Creating data array for present in table header in teamShiftScheduleVC
func getWeekdaysArray(currentMonth: Int, firstWeekDayOfMonth: Int, currentYear: Int) -> [String] {
    
    var daysCount = numbersOfDaysInMonth[currentMonth]
    
    //    For leap year, make february month of 29 days
    if currentMonth == 1 {
        if currentYear % 4 == 0 {
            daysCount = 29
        } else {
            daysCount = 28
        }
    }
    
    var currentWeekday = firstWeekDayOfMonth - 1
    
    var weekdays: [String] = []
    var counter = 1
    
    while counter != daysCount + 1 {
        weekdays.append(daysOfWeek[currentWeekday])
        currentWeekday += 1
        if currentWeekday == 7 {
            currentWeekday = 0
        }
        counter += 1
    }
    
    return weekdays
}

func getWeekendsIndexesForCurrentMonth(weekdays: [String]) -> [Int] {
    
    var weekendsIndexes: [Int] = []
    var index = 0
    
    while index < weekdays.count {
        if weekdays[index] == "Sa" || weekdays[index] == "Su" {
            weekendsIndexes.append(index + 1)
        }
        index += 1
    }
    
    return weekendsIndexes
}
