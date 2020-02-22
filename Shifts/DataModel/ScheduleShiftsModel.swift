//
//  ScheduleShiftsModel.swift
//  Shifts
//
//  Created by Viktor on 21.02.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import Foundation

class ScheduleShifts: Decodable {
    
    
    let monthlyScheduleName: String?
    let shifts: [Shift]
    
    enum CodingKeys: String, CodingKey {
        case monthlyScheduleName
        case shifts
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        monthlyScheduleName = try container.decode(String.self, forKey: .monthlyScheduleName)
        shifts = try container.decode([Shift].self, forKey: .shifts)
     
    }
}



