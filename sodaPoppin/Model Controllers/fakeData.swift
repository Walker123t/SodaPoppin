//
//  fakeData.swift
//  sodaPoppin
//
//  Created by Trevor Walker on 8/19/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import Foundation
class FakeData {
    
    var drinks: [Drink]{
        let drink1 = Drink(uuid: "", name: "Drink 1", ingredients: ["one", "two", "three"], notes: "none")
        let drink2 = Drink(uuid: "", name: "Drink 2", ingredients: ["one", "two", "three" , "Four", "Five", "Six"], notes: "none")
        let drink3 = Drink(uuid: "", name: "Drink 3", ingredients: ["one", "two"], notes: "none")
        let drink4 = Drink(uuid: "", name: "Drink 4", ingredients: ["one", "two", "three"], notes: "none")
        return [drink1, drink2, drink3, drink4]
    }
    
    var people: [User]{
        let user1 = User(name: "Person1", userName: "Username1", profilePic: nil, desc: "a good description", favDrink: drinks[0])
        let user2 = User(name: "Person2", userName: "Username2", profilePic: nil, desc: "a good description", favDrink: drinks[1])
        let user3 = User(name: "Person3", userName: "Username3", profilePic: nil, desc: "a good description", favDrink: drinks[2])
        let user4 = User(name: "Person4", userName: "Username4", profilePic: nil, desc: "a good description", favDrink: drinks[3])
        return [user1, user2, user3, user4]
    }
}
