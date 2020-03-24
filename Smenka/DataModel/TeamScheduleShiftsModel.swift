//
//  TeamScheduleShiftsModel.swift
//  Smenka
//
//  Created by Viktor on 24.03.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit
import RealmSwift

@objcMembers class TeamScheduleShifts: Object, Decodable {
    
    dynamic var monthlyScheduleName = "yyyy-MM"
    var personalScheduleShifts = List<PersonalScheduleShifts>()

    override var description: String {
        return "Date - \(monthlyScheduleName), shifts - \(personalScheduleShifts)"
    }
    
}
