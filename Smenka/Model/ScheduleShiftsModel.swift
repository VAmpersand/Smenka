//
//  ScheduleShiftsModel.swift
//  Smenka
//
//  Created by Viktor on 30.01.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import RealmSwift

class ScheduleShifts: Object {
    
    let shifts = List<Shift>()
    
}

