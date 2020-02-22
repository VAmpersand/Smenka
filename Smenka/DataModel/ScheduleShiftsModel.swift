//
//  ScheduleShiftsModel.swift
//  Smenka
//
//  Created by Viktor on 03.02.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import Realm
import RealmSwift

@objcMembers class ScheduleShifts: Object {
    
    dynamic var monthlyScheduleName = "yyyy-MM"
    var shifts = List<Shift>()
    
    
//    enum CodingKeys: String, CodingKey {
//        case monthlyScheduleName
//        case shifts
//    }
//
//    required init(from decoder: Decoder) throws
//    {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        monthlyScheduleName = try container.decode(String.self, forKey: .monthlyScheduleName)
//
//        let shift = try container.decode([Shift].self, forKey: .shifts)
//        shifts.append(objectsIn: shift)
//
//        super.init()
//    }
//
//    override static func primaryKey() -> String?
//     {
//         return "monthlyScheduleName"
//     }
//
//     required init()
//     {
//         super.init()
//     }
//
//    required init(value: Any, schema: Schema)
//     {
//         super.init(value: value, schema: schema)
//     }
//
//    required init(realm: Realm, schema: RLMSchema.objectSchema)
//     {
//         super.init(realm: realm, schema: schema)
//     }
}
