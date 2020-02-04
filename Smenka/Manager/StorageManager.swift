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
    
    static func saveSchedaleShift(_ schedaleShifts: SchedaleShifts) {
        try! realm.write {
            realm.add(schedaleShifts)
        }
    }

    static func removeShift(_ schedaleShifts: SchedaleShifts) {
        try! realm.write {
            realm.delete(schedaleShifts)
        }
    }

    static func editShift(_ schedaleShifts: SchedaleShifts, _ newSchedaleShifts: SchedaleShifts) {
        try! realm.write {
            schedaleShifts.shifts = newSchedaleShifts.shifts
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
