//
//  PersonalScheduleShiftsModel.swift
//  Smenka
//
//  Created by Viktor on 03.02.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit
import RealmSwift

@objcMembers class PersonalScheduleShifts: Object, Decodable {
    
    dynamic var monthlyScheduleName = "yyyy-MM"
    dynamic var employee: Staff!
    var shifts = List<Shift>()

    override var description: String {
        return "Date - \(monthlyScheduleName), shifts - \(shifts)"
    }
    
}
