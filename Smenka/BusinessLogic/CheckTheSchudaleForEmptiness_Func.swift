//
//  CheckTheScheduleForEmptiness_Func.swift
//  Smenka
//
//  Created by Viktor on 04.02.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit
import RealmSwift

func checkTheScheduleForEmptiness(schedulesShifts: Results<PersonalScheduleShifts>!, currentYear: Int, currentMonthIndex: Int) -> Bool {
    
    var shiftIsEdited = false
    
    guard let schedulesShifts = schedulesShifts else { return shiftIsEdited}
    for scheduleShift in schedulesShifts {
        if scheduleShift.monthlyScheduleName == "\(currentYear)-\(currentMonthIndex)" {
            for shift in scheduleShift.shifts {
                if shift.shiftTypeIndex != 0 {
                    shiftIsEdited = true
                }
            }
        }
    }
    return shiftIsEdited
}







