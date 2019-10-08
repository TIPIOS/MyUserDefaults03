//
//  Extensions.swift
//  MyUserDefaults
//
//  Created by Luc Derosne on 30/09/2019.
//  Copyright © 2019 Luc Derosne. All rights reserved.
//

// convert color for UserDefault
import Foundation
import UIKit

extension UserDefaults {
    func colorForKey(key: String) -> UIColor? {
        if let colorData = data(forKey: key),
            let color = try? NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: colorData)
        {
            return color
        } else {
            return nil
        }
    }
    func setColor(color: UIColor?, forKey key: String) {
        if let color = color,
            let colorData = try? NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: true)
        {
            set(colorData, forKey: key)
        }
    }
}
