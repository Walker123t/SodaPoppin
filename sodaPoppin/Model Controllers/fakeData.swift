//
//  fakeData.swift
//  sodaPoppin
//
//  Created by Trevor Walker on 8/19/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import Foundation

class FakeData {
    
    static var shared = FakeData()
    
    var drinks: [Drink] = [Drink(uuid: "", name: "Drink 1", mainSodaName: "Sprite", ingredients: ["Pineapple","Blueberry","Coconut"]), Drink(uuid: "", name: "Drink 2", mainSodaName: "Dr. Pepper", ingredients: ["Pineapple","Blueberry","Coconut" , "Guava","Lavendar","Rasberry"]), Drink(uuid: "", name: "Drink 3", mainSodaName: "Root Beer", ingredients: ["Rasberry","Coconut"]), Drink(uuid: "", name: "Drink 4", mainSodaName: "Coke", ingredients: ["Pineapple","Blueberry","Coconut"])]

    var inventory: [String] = ["Pineapple", "Blueberry", "Orange", "Mango"]
    var ingredients: [String] = []
    var shoppingList: [(String, Bool)] = [("one", true), ("two", false)]
}
