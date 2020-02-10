//
//  ShiftTypeModel.swift
//  Smenka
//
//  Created by Viktor on 31.01.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import RealmSwift

class ShiftType: Object {
    
    @objc dynamic var shiftTypeName = "Shift Type"
    @objc dynamic var startTime = Date()
    @objc dynamic var endTime = Date()
    @objc dynamic var shiftColorIndex = Int()
    
    override var description: String {
        return "Shift Type - \(shiftTypeName), start time - \(startTime), end time - \(endTime), color index - \(shiftColorIndex)"
    }
}



