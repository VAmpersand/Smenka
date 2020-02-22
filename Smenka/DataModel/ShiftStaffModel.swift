//
//  ShiftStaffModel.swift
//  Smenka
//
//  Created by Viktor on 07.02.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import RealmSwift

@objcMembers class ShiftStaff: Object {
    
    dynamic var employee: Staff!
    dynamic var shiftType: ShiftType!
    
}
