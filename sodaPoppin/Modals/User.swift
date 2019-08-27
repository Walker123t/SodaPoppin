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
    
    init(name: String, userName: String, profilePic: UIImage?, desc: String, favDrink: Drink){
        self.name = name
        self.userName = userName
        self.profilePic = profilePic
        self.desc = desc
        self.favDrink = favDrink
    }
}
