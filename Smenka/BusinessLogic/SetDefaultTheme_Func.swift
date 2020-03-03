//
//  SetDefaultTheme_Func.swift
//  Smenka
//
//  Created by Viktor on 03.03.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import Foundation

let defaultThemeStyle = UserDefaults.standard

func setThemeInDefault(theme: ThemeStyle) {
    if theme == .dark {
        defaultThemeStyle.set("dark", forKey: "defaultTheme")
    } else {
        defaultThemeStyle.set("light", forKey: "defaultTheme")
    }
}
