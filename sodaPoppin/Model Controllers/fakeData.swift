//
//  fakeData.swift
//  sodaPoppin
//
//  Created by Trevor Walker on 8/19/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import Foundation

class FakeData {
    
    var drinks: [Drink] = [Drink(uuid: "", name: "Drink 1", ingredients: ["one", "two", "three"], notes: "none"), Drink(uuid: "", name: "Drink 2", ingredients: ["one", "two", "three" , "Four", "Five", "Six"], notes: "none"), Drink(uuid: "", name: "Drink 3", ingredients: ["one", "two"], notes: "none"), Drink(uuid: "", name: "Drink 4", ingredients: ["one", "two", "three"], notes: "none")]
    
    var people: [User]{
        let user1 = User(name: "Person1", userName: "Username1", profilePic: nil, desc: "a good description", favDrink: drinks[0], uuid: nil)
        let user2 = User(name: "Person2", userName: "Username2", profilePic: nil, desc: "a good description", favDrink: drinks[1], uuid: nil)
        let user3 = User(name: "Person3", userName: "Username3", profilePic: nil, desc: "a good description", favDrink: drinks[2], uuid: nil)
        let user4 = User(name: "Person4", userName: "Username4", profilePic: nil, desc: "a good description", favDrink: drinks[3], uuid: nil)
        return [user1, user2, user3, user4]
    }
    
    var currentUser: CurrentUser {
        let currentUser = CurrentUser(userImage: #imageLiteral(resourceName: "JasonFace"), name: "Jason Mandozi", location: "Boston, MA", friends: [], favoriteDrink: drinks[0])
        return currentUser
    }
    
    var inventory: [String] = ["one", "two", "three", "four"]
    var shoppingList: [String: Bool] = ["one": true, "two": false]
}
