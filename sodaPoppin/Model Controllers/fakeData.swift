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
    
    var drinks: [Drink] = [Drink(uuid: "", name: "Drink 1", mainSodaName: "Sprite", ingredients: ["Pineapple","Blueberry","Coconut"], creator: "129857125"), Drink(uuid: "", name: "Drink 2", mainSodaName: "Dr. Pepper", ingredients: ["Pineapple","Blueberry","Coconut" , "Guava","Lavendar","Rasberry"], creator: "209875109"), Drink(uuid: "", name: "Drink 3", mainSodaName: "Root Beer", ingredients: ["Rasberry","Coconut"], creator: "2498540"), Drink(uuid: "", name: "Drink 4", mainSodaName: "Coke", ingredients: ["Pineapple","Blueberry","Coconut"], creator: "1201341324")]

    var inventory: [String] = ["Pineapple", "Blueberry", "Orange", "Mango"]
    var ingredients: [String] = []
    var shoppingList: [(String, Bool)] = [("one", true), ("two", false)]
}
