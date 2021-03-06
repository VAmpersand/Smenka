//
//  ShiftTypeModel.swift
//  Smenka
//
//  Created by Viktor on 31.01.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit
import RealmSwift

@objcMembers class ShiftType: Object, Decodable {
    
    dynamic var shiftTypeName = "Shift Type"
    dynamic var startTime = "Time formater"
    dynamic var endTime = "Time formater"
    dynamic var shiftColorIndex = Int()
    
    override var description: String {
        return "Shift Type - \(shiftTypeName), start time - \(startTime), end time - \(endTime), color index - \(shiftColorIndex)"
    }
}



