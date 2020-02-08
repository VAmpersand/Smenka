//
//  RemoveScheduleShifts_Func.swift
//  Smenka
//
//  Created by Viktor on 04.02.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit
import RealmSwift

func removeSchedulleShifts(schedulesShifts: Results<ScheduleShifts>, currentYear: Int, currentMonthIndex: Int) {
    
    for scheduleShift in schedulesShifts {
        if scheduleShift.monthlyScheduleName == "\(currentYear)-\(currentMonthIndex)" {
//            var shiftCounter = 0
//            let scheduleShiftCount = scheduleShift.shifts.count - 1
            DispatchQueue.main.async {
//                while shiftCounter != scheduleShiftCount  {
//                    StorageManager.removeShift(scheduleShift.shifts[shiftCounter])
//                    shiftCounter += 1
//                }
//                if scheduleShift.shifts.isEmpty {
                    StorageManager.removeScheduleShift(scheduleShift)
//                }
            }
        }
    }
}
