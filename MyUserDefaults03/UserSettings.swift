//
//  UserSettings.swift
//  MyUserDefaults02
//
//  Created by Luc Derosne on 05/10/2019.
//  Copyright © 2019 Luc Derosne. All rights reserved.
//
// UserDefaults 03 @Property Wrapper

import UIKit

@propertyWrapper
struct MesUserDefaults<DataType> {
    let key: String
    let defaultValue: DataType
    var wrappedValue: DataType {
        get {
            return UserDefaults.standard.object(forKey: key) as? DataType ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

struct UserSettings {
    @MesUserDefaults(key: "ID", defaultValue: "")
    static var id : String
    
    @MesUserDefaults(key: "Pseudo", defaultValue: "")
    static var pseudo : String
    
    @MesUserDefaults(key: "Vip", defaultValue: false)
    static var vip: Bool
    
    static var backColor:UIColor {
        get {
            return UserDefaults.standard.colorForKey(key:  "BackColor") ?? .blue
        }
        set {
            UserDefaults.standard.setColor(color: newValue, forKey: "BackColor")
        }
    }
}
