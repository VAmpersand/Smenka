//
//  CheckTheShiftTypeForExistence_Func.swift
//  Smenka
//
//  Created by Viktor on 15.02.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit
import RealmSwift

func checkTheShidtTypeForExistence(shiftTypes: Results<ShiftType>!, shiftTypeName: String) -> Bool {
    
    var nameIsMatch = false
    
    guard let shiftTypes = shiftTypes else { return nameIsMatch}
    for shiftType in shiftTypes {
        if shiftType.shiftTypeName == shiftTypeName {
            nameIsMatch = true
        }
    }
    return nameIsMatch
}


