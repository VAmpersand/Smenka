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
    
    //   Action with scheduleShift
    static func saveScheduleShift(_ scheduleShifts: ScheduleShifts) {
        try! realm.write {
            realm.add(scheduleShifts)
        }
    }
    
    //  !!!An error when deleting a shift schedule does not delete the shift list!!!
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
    
    
    //   Action with shift
    static func removeShift(_ shift: Shift) {
        try! realm.write {
            realm.delete(shift)
        }
    }
    
    static func editShift(_ shift: Shift, _ newShift: Shift) {
        try! realm.write {
            shift.shiftTypeIndex = newShift.shiftTypeIndex
            shift.shiftStaff = newShift.shiftStaff
        }
    }
    
    
    //   Action with shiftType
    static func saveShiftType(_ shiftType: ShiftType) {
        try! realm.write {
            realm.add(shiftType)
        }
    }
    
    static func removeShiftType(_ shiftType: ShiftType) {
        try! realm.write {
            realm.delete(shiftType)
        }
    }
    
    static func editShiftType(_ shiftType: ShiftType, _ newShiftType: ShiftType) {
        try! realm.write {
            shiftType.shiftTypeName = newShiftType.shiftTypeName
            shiftType.shiftColorIndex = newShiftType.shiftColorIndex
            shiftType.startTime = newShiftType.startTime
            shiftType.endTime = newShiftType.endTime
        }
    }
    
    
    //   Action with staff
    static func saveStaff(_ staff: Staff) {
        try! realm.write {
            realm.add(staff)
        }
    }
    
    static func removeStaff(_ staff: Staff) {
        try! realm.write {
            realm.delete(staff)
        }
    }
    
    static func editStaff(_ staff: Staff, _ newStaff: Staff) {
        try! realm.write {
            staff.employeeName = newStaff.employeeName
            staff.employeeSurname = newStaff.employeeSurname
            staff.employeePosition = newStaff.employeePosition
        }
    }
    
}
