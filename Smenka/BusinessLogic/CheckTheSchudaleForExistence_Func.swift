//
//  CheckTheScheduleForExistence_Func.swift
//  Smenka
//
//  Created by Viktor on 04.02.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit
import RealmSwift

func checkTheScheduleForExistence(schedulesShifts: Results<ScheduleShifts>!, currentYear: Int, currentMonthIndex: Int) -> Bool {
    
    let currentSchedalName = "\(currentYear)-\(currentMonthIndex)"
    var nameIsMatch = false
    
    guard let schedulesShifts = schedulesShifts else { return nameIsMatch}
    for schedaleShift in schedulesShifts {
        if schedaleShift.monthlyScheduleName == currentSchedalName {
            nameIsMatch = true
        }
    }
    return nameIsMatch
}
