//
//  ShiftStaffModel.swift
//  Smenka
//
//  Created by Viktor on 07.02.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import RealmSwift

class ShiftStaff: Object {
    
    @objc dynamic var employee: Staff!
    @objc dynamic var shiftType: ShiftType!
    
}
