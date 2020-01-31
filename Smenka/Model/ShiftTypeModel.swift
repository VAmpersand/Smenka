//
//  ShiftTypeModel.swift
//  Smenka
//
//  Created by Viktor on 31.01.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import RealmSwift

class ShiftType: Object {
    
    @objc dynamic var shiftTypeName = "Sift type name"
    @objc dynamic var startTime = Date()
    @objc dynamic var endTime = Date()
    @objc dynamic var shiftColor = UIColor.self
    
}
