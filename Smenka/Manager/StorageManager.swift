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
    static func saveScheduleShift(_ scheduleShifts: PersonalScheduleShifts) {
        try! realm.write {
            realm.add(scheduleShifts)
        }
    }
    
    static func removeScheduleShift(_ scheduleShifts: PersonalScheduleShifts) {
        try! realm.write {
            realm.delete(scheduleShifts, cascading: true)
        }
    }
    
    static func editScheduleShift(_ scheduleShifts: PersonalScheduleShifts, _ newScheduleShifts: PersonalScheduleShifts) {
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
    static func saveEmployee(_ employee: Employee) {
        try! realm.write {
            realm.add(employee)
        }
    }
    
    static func removeEmployee(_ employee: Employee) {
        try! realm.write {
            realm.delete(employee)
        }
    }
    
    static func editEmployee(_ employee: Employee, _ newEmployee: Employee) {
        try! realm.write {
            employee.employeeName = newEmployee.employeeName
            employee.employeeSurname = newEmployee.employeeSurname
            employee.employeePosition = newEmployee.employeePosition
        }
    }
    
}
