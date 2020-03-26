//
//  EmployeeModel.swift
//  Smenka
//
//  Created by Viktor on 30.01.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit
import RealmSwift

@objcMembers class Employee: Object, Decodable {
    
    dynamic var employeeName = "Employee name"
    dynamic var employeeSurname = "Employee surname"
    dynamic var employeePosition = "Employee position"
    
    override var description: String {
        return "Employee name - \(employeeName), surname - \(employeeSurname), position - \(employeePosition)"
    }
}

