//
//  ScheduleShiftsModel.swift
//  Shifts
//
//  Created by Viktor on 21.02.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

class ScheduleShifts: Codable {
    
    enum CodingKeys: String, CodingKey {
        case monthlyScheduleName
        case shifts
    }
    
    let monthlyScheduleName: String?
    let shifts: [Shift]
    
    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(title, forKey: .title)
//        try container.encode(price, forKey: .price)
//        try container.encode(quantity, forKey: .quantity)
//    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        monthlyScheduleName = try container.decode(String.self, forKey: .monthlyScheduleName)
        shifts = try container.decode([Shift].self, forKey: .shifts)
     
    }
}



