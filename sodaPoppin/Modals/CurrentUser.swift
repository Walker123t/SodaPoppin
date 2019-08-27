//
//  CurrentUser.swift
//  sodaPoppin
//
//  Created by Trevor Walker on 8/27/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit

class CurrentUser {
    var userImage: UIImage?
    var name: String
    var location: String
    var friends: [User]
    var favoriteDrink: Drink
    
    init(userImage: UIImage?, name: String, location: String, friends: [User], favoriteDrink: Drink){
        self.userImage = userImage
        self.name = name
        self.location = location
        self.friends = friends
        self.favoriteDrink = favoriteDrink
    }
}
