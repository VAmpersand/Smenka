//
//  SettingDefaultDBRealmDirectory.swift
//  Smenka
//
//  Created by Viktor on 01.03.2020.
//  Copyright © 2020 Viktor. All rights reserved.
//

import UIKit
import RealmSwift

func setDefaultDBRealmDirectory() {
    
    let identifire = "group.Smenka.widgetShare"
    var directory: URL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: identifire)!
    directory.appendPathComponent("db.realm", isDirectory: true)
    
    let config = Realm.Configuration(
        fileURL: directory,
        schemaVersion: 1, migrationBlock: { migration, oldschemaVersion in })
    
    Realm.Configuration.defaultConfiguration = config
    print(directory)
}
