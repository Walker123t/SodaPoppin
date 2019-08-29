//
//  UserDefaultsController.swift
//  sodaPoppin
//
//  Created by Nic Gibson on 8/29/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import Foundation

class UserDefaultsController {
    
    static func saveUIDToDefaults(_ uid: String) {
        
        UserDefaults.standard.set(uid, forKey: "UID")
    }
    
    static func loadUIDFromDefaults() -> String? {
        
        return UserDefaults.standard.string(forKey: "UID")
    }
}
