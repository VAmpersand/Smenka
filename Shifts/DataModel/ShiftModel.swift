//
//  ShiftModel.swift
//  Shifts
//
//  Created by Viktor on 21.02.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import Foundation

class Shift: Codable {
    
    let shiftTypeIndex: Int?
    
    enum CodingKeys: String, CodingKey {
        case shiftTypeIndex
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        shiftTypeIndex = try container.decode(Int.self, forKey: .shiftTypeIndex)
    }
}
