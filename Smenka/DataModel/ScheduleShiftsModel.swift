//
//  ScheduleShiftsModel.swift
//  Smenka
//
//  Created by Viktor on 03.02.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import RealmSwift

class ScheduleShifts: Object {
    
    @objc dynamic var monthlyScheduleName = "yyyy-MM"
    var shifts = List<Shift>()
    
}
