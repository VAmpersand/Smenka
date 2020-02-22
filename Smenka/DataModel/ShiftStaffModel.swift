//
//  ShiftStaffModel.swift
//  Smenka
//
//  Created by Viktor on 07.02.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit
import RealmSwift

@objcMembers class ShiftStaff: Object, Decodable {
    
    dynamic var employee: Staff!
    dynamic var shiftType: ShiftType!
    
}
