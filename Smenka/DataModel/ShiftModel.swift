//
//  ShiftModel.swift
//  Smenka
//
//  Created by Viktor on 30.01.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit
import RealmSwift

@objcMembers public class Shift: Object, Decodable {
    
    dynamic var shiftDate = Date()
    dynamic var shiftTypeIndex = 0
    var shiftStaff = List<ShiftStaff>()
    
    private enum CodingKeys: String, CodingKey {
        case shiftTypeIndex
    }
    
    required convenience public init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.shiftTypeIndex = try container.decode(Int.self, forKey: .shiftTypeIndex)
    }
 
    override public var description: String {
        return "Date - \(shiftDate), type index - \(shiftTypeIndex)"
    }
}




