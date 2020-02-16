//
//  SetEmptySchedaleShifts.swift
//  Smenka
//
//  Created by Viktor on 04.02.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit
import RealmSwift

func setEmptyScheduleShifts(currentYear: Int, currentMonthIndex: Int) -> ScheduleShifts {
    
    let scheduleShifts = ScheduleShifts()
    scheduleShifts.monthlyScheduleName = "\(currentYear)-\(currentMonthIndex)"
    
    var emptyCellsCounter = 0
    var dateCounter = 0
    
    while dateCounter != 31 {
        dateCounter += 1
        let shift = Shift()
        shift.shiftDate = ("\(currentYear)-\(currentMonthIndex)-\(dateCounter)").dateStr!
        scheduleShifts.shifts.append(shift)
    }
    
    let firstWeekDayOfMonth = getIndexFirstWeekDay(currentYear: currentYear, currentMonthIndex: currentMonthIndex)
    
    while emptyCellsCounter != firstWeekDayOfMonth - 1 {
        emptyCellsCounter += 1
        scheduleShifts.shifts.insert(Shift(), at: 0)
    }

    return scheduleShifts
}



