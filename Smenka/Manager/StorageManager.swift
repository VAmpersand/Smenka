//
//  StorageManager.swift
//  Smenka
//
//  Created by Viktor on 30.01.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static func saveSchedaleShift(_ scheduleShifts: ScheduleShifts) {
        try! realm.write {
            realm.add(scheduleShifts)
        }
    }

    static func removeShift(_ scheduleShifts: ScheduleShifts) {
        try! realm.write {
            realm.delete(scheduleShifts)
        }
    }

    static func editShift(_ scheduleShifts: ScheduleShifts, _ newScheduleShifts: ScheduleShifts) {
        try! realm.write {
            scheduleShifts.shifts = newScheduleShifts.shifts
        }
    }
    


    static func saveShift(_ shift: Shift) {
        try! realm.write {
            realm.add(shift)
        }
    }

    static func removeShift(_ shift: Shift) {
        try! realm.write {
            realm.delete(shift)
        }
    }

    static func editShift(_ shift: Shift, _ newShift: Shift) {
        try! realm.write {
            shift.shiftTypeIndex = newShift.shiftTypeIndex
        }
    }
}
