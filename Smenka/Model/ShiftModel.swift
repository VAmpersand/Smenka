//
//  ShiftModel.swift
//  Smenka
//
//  Created by Viktor on 30.01.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import RealmSwift

class Shift: Object {
    
    @objc dynamic var shiftName = "Sift name"
    @objc dynamic var startShift = Date()
    @objc dynamic var endShift = Date()
    @objc dynamic var shiftColor = UIColor.self
    let shiftStaff = List<Staff>()
    
}


