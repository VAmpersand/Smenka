//
//  SettingFistClearShiftType_Func.swift
//  Smenka
//
//  Created by Viktor on 01.03.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit
import RealmSwift

//MARK: Creation clear shiftType for day withaut shift
 func setFirstClearShiftType() {
     let shiftType = ShiftType()
     shiftType.shiftTypeName = "Clear shift type"
     shiftType.shiftColorIndex = 18
     DispatchQueue.main.async {
         StorageManager.saveShiftType(shiftType)
     }
 }
