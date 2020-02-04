//
//  CheckTheSchedaleForExistence_Func.swift
//  Smenka
//
//  Created by Viktor on 04.02.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit
import RealmSwift

func checkTheSchedalleForExistence(schedaleShifts: List<SchedaleShifts>, currentYear: Int, currentMonthIndex: Int) -> Bool {
    
    let currentSchedalName = "\(currentYear)-\(currentMonthIndex)"
    var nameIsMatch = false
    
    for schedaleShift in schedaleShifts {
        if schedaleShift.monthlyScheduleName == currentSchedalName {
            nameIsMatch = true
        }
    }
    return nameIsMatch
}
