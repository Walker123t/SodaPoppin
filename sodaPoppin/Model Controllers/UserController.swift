//
//  UserController.swift
//  sodaPoppin
//
//  Created by Trevor Walker on 8/27/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit

class UserContontroller{
    static let shared = UserContontroller()
    
    var users: [User] = []
    
    let fakeData = FakeData()
    
    func loadData(){
        users = fakeData.people
    }
    
    func createUser(name: String, userName: String, profilePic: UIImage, desc: String, favDrink: Drink, uuid: String){
        let newUser = User(name: name, userName: userName, profilePic: profilePic, desc: desc, favDrink: favDrink, uuid: uuid)
        users.append(newUser)
    }
}
