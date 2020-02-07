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
    
    static func saveScheduleShift(_ scheduleShifts: ScheduleShifts) {
        try! realm.write {
            realm.add(scheduleShifts)
        }
    }

    // An error when deleting a shift schedule does not delete the shift list
    static func removeScheduleShift(_ scheduleShifts: ScheduleShifts) {
        try! realm.write {
            realm.delete(scheduleShifts)
        }
    }

    static func editScheduleShift(_ scheduleShifts: ScheduleShifts, _ newScheduleShifts: ScheduleShifts) {
        try! realm.write {
            scheduleShifts.shifts = newScheduleShifts.shifts
        }
    }
    
    static func editShift(_ shift: Shift, _ newShift: Shift) {
        try! realm.write {
            shift.shiftTypeIndex = newShift.shiftTypeIndex
            shift.shiftStaff = newShift.shiftStaff
        }
    }
}
