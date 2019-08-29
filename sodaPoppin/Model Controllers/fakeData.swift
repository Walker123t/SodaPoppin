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
    
    var drinks: [Drink] = [Drink(uuid: "", name: "Drink 1", mainSodaName: "Sprite", ingredients: ["one", "two", "three"], notes: "none"), Drink(uuid: "", name: "Drink 2", mainSodaName: "Dr. Pepper", ingredients: ["one", "two", "three" , "Four", "Five", "Six"], notes: "none"), Drink(uuid: "", name: "Drink 3", mainSodaName: "Root Beer", ingredients: ["one", "two"], notes: "none"), Drink(uuid: "", name: "Drink 4", mainSodaName: "Coke", ingredients: ["one", "two", "three"], notes: "none")]
    
    var inventory: [String] = ["one", "two", "three", "four"]
    var shoppingList: [(String, Bool)] = [("one", true), ("two", false)]
}

