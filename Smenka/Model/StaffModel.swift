//
//  StaffModel.swift
//  Smenka
//
//  Created by Viktor on 30.01.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import RealmSwift

class Staff: Object {
    
    @objc dynamic var employeeName = "Employee name"
    @objc dynamic var employeeSurname = "Employee surname"
    @objc dynamic var startEmployeesSift = Date()
    @objc dynamic var endEmployeesSift = Date()
   
}

