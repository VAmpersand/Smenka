//
//  ScheduleShiftsModel.swift
//  Smenka
//
//  Created by Viktor on 30.01.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import RealmSwift

class SchedulsShifts: Object {
    
    let schedalShifts = List<Shift>()
    let shiftTypes = List<ShiftType>()
    
}

