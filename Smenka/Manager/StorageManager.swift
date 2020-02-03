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
    
    static func saveSchedalShift(_ schedalShifts: SchedalShifts) {
        try! realm.write {
            realm.add(schedalShifts)
        }
    }

    static func removeShift(_ schedalShifts: SchedalShifts) {
        try! realm.write {
            realm.delete(schedalShifts)
        }
    }

    static func editShift(_ schedalShifts: SchedalShifts, _ newSchedalShifts: SchedalShifts) {
        try! realm.write {
            schedalShifts.shifts = newSchedalShifts.shifts
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
