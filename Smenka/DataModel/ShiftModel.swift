//
//  ShiftModel.swift
//  Smenka
//
//  Created by Viktor on 30.01.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import RealmSwift

@objcMembers class Shift: Object {
    
    dynamic var shiftDate = Date()
    dynamic var shiftTypeIndex = 0
    var shiftStaff = List<ShiftStaff>()

    override var description: String {
        return "Date - \(shiftDate), type index - \(shiftTypeIndex)"
    }
}




