//
//  CalendarDataSourse.swift
//  Smenka
//
//  Created by Viktor on 21.01.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import Foundation

let date = Date()
let calendar = Calendar.current

let day = calendar.component(.day, from: date)
let weekday = calendar.component(.weekday, from: date)
let month = calendar.component(.month, from: date) - 1
let year = calendar.component(.year, from: date)

let months = ["January", "February", "March", "April",
              "May", "June", "July", "August", "September",
              "October", "November", "December"]

let daysOfWeek = ["Mondey", "Thuesday","Wednesday", "Thursday",
                  "Friday", "Saturday", "Sunday",]

let daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]



