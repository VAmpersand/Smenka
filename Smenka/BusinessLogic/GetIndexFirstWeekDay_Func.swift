//
//  GetIndexFirstWeekDay.swift
//  Smenka
//
//  Created by Viktor on 04.02.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit
import RealmSwift

func getIndexFirstWeekDay(currentYear: Int, currentMonthIndex: Int ) -> Int {
    let date = "\(currentYear)-\(currentMonthIndex)-01"
    let day = (date.dateStr?.firstDayOfTheMonth.weekday)!
    return day
}

