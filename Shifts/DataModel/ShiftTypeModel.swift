//
//  ShiftTypeModel.swift
//  Shifts
//
//  Created by Viktor on 21.02.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import Foundation

class ShiftType: Codable {
    
    let shiftColorIndex: Int?
    
    enum CodingKeys: String, CodingKey {
        case shiftColorIndex
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        shiftColorIndex = try container.decode(Int.self, forKey: .shiftColorIndex)
    }

}
