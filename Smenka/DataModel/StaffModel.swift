//
//  StaffModel.swift
//  Smenka
//
//  Created by Viktor on 30.01.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import RealmSwift

@objcMembers class Staff: Object {
    
    dynamic var employeeName = "Employee name"
    dynamic var employeeSurname = "Employee surname"
    dynamic var employeePosition = "Employee position"
    
}

