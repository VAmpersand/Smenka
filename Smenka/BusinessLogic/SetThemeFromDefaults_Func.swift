//
//  SetThemeFromDefaults.swift
//  Smenka
//
//  Created by Viktor on 03.03.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import Foundation

func setThemeFromDefaults() {
    
    guard let defaultTheme = defaultThemeStyle.value(forKey: "defaultTheme") as? String else { return }
    if defaultTheme == "dark" {
        Style.themeDark()
    } else {
        Style.themeLight()
    }
}
