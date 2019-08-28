//
//  person.swift
//  sodaPoppin
//
//  Created by Trevor Walker on 8/18/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit

class User {
    var name: String
    var userName: String
    var profilePic: UIImage?
    var desc: String
    var favDrink: Drink
    var uuid: String
    
    init(name: String, userName: String, profilePic: UIImage?, desc: String, favDrink: Drink, uuid: String?){
        self.name = name
        self.userName = userName
        self.profilePic = profilePic
        self.desc = desc
        self.favDrink = favDrink
        self.uuid = uuid ?? UUID().uuidString
    }
}
extension User: Equatable{
    static func == (lhs: User, rhs: User) -> Bool {
        if lhs.uuid == rhs.uuid {
            return true
        }
        return false
    }
    
    
}
