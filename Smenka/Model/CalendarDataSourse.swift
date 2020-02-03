//
//  CalendarDataSourse.swift
//  Smenka
//
//  Created by Viktor on 21.01.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit
import RealmSwift

let months = ["January", "February", "March", "April",
              "May", "June", "July", "August", "September",
              "October", "November", "December"]

let daysOfWeek = ["Mondey", "Thuesday","Wednesday", "Thursday",
                  "Friday", "Saturday", "Sunday",]

var numbersOfDaysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]



// Add test data

let testColors: [UIColor] = [.clear, .red, .blue, .green, .black, .yellow]
let testShiftTypes = [testShiftTipe, testShiftTipe, testShiftTipe,
                      testShiftTipe, testShiftTipe, testShiftTipe]

var testShifts: [Shift] = []
let testShiftTipe = ShiftType()

func setTestShifts() {
    
    var counter = 0
    while counter != 40 {
        counter += 1

        testShifts.append(Shift())
    }
}



