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
            DispatchQueue.main.async {
                StorageManager.removeScheduleShift(scheduleShift)
            }
        }
    }
}

