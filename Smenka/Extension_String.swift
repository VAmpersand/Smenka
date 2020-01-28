//
//  Extension_String.swift
//  Smenka
//
//  Created by Viktor on 28.01.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import Foundation

extension String {
    
    static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    var dateStr: Date? {
        return String.dateFormatter.date(from: self)
    }
}
