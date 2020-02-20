//
//  CheckTheShiftTypeForExistence_Func.swift
//  Smenka
//
//  Created by Viktor on 15.02.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit
import RealmSwift

func checkTheShiftTypeForExistence(shiftTypes: Results<ShiftType>!, shiftTypeName: String) -> Bool {
    
    var nameIsMatch = false
    
    guard let shiftTypes = shiftTypes else { return nameIsMatch}
    for shiftType in shiftTypes {
        if shiftType.shiftTypeName == shiftTypeName {
            nameIsMatch = true
        }
    }
    return nameIsMatch
}

    
//func checkTheResaltsForExistence(results: Results<Object>!, name: String) -> Bool {
//
//    var nameIsMatch = false
//
//    guard let results = results else { return nameIsMatch}
//    for result in results {
//        if type(of: result) == ShiftType.self {
//            let result = ShiftType(value: result)
//            if result.shiftTypeName == name {
//                nameIsMatch = true
//            }
//        } else if type(of: result) == ScheduleShifts.self {
//            let result = ScheduleShifts(value: result)
//            if result.monthlyScheduleName == name {
//                for shift in result.shifts {
//                    if shift.shiftTypeIndex != 0 {
//                        nameIsMatch = true
//                    }
//                }
//            }
//        }
//    }
//    return nameIsMatch
//}
