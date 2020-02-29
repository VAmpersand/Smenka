//
//  SetEmptySaredData.swift
//  Smenka
//
//  Created by Viktor on 29.02.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit

var colorIndexes: [Int] = []
var sharedDate: [Int] = []

func getEmptySharedDate() {
    var counter = 0
    sharedDate = []
    while counter != 37 {
        sharedDate.append(0)
        counter += 1
    }
}

func getEmptyColorIndexes() {
    var counter = 0
    colorIndexes = []
    while counter != 37 {
        colorIndexes.append(18)
        counter += 1
    }
}

