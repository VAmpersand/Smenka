//
//  ShiftModel.swift
//  Smenka
//
//  Created by Viktor on 30.01.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import RealmSwift

class Shift: Object {
    
    @objc dynamic var shiftDate = Date()
    @objc dynamic var shiftType = "Shift Type"
    var shiftStaff = List<Staff>()

}



