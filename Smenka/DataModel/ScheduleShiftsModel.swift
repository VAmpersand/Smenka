//
//  ScheduleShiftsModel.swift
//  Smenka
//
//  Created by Viktor on 03.02.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit
import RealmSwift

@objcMembers public class ScheduleShifts: Object, Decodable {
    
    dynamic var monthlyScheduleName = "yyyy-MM"
    var shifts = List<Shift>()
    
    private enum CodingKeys: String, CodingKey {
        case monthlyScheduleName
        case shifts
    }
    
    required convenience public init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.monthlyScheduleName = try container.decode(String.self, forKey: .monthlyScheduleName)
        self.shifts = try container.decode(List<Shift>.self, forKey: .shifts)
    }
    
    override public var description: String {
        return "Date - \(monthlyScheduleName), shifts - \(shifts)"
    }
    
}
