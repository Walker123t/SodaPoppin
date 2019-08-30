//
//  MyDrinksController.swift
//  sodaPoppin
//
//  Created by Nic Gibson on 8/20/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import Foundation

class MyDrinksController {
    
    static let shared = MyDrinksController()

    var inventory: [String] = []
    var ingredients: [String] = []
    var myDrinks: [Drink] = []
//    var shoppingList: [(String, Bool)] = [("one", true), ("two", false)]
    
    
    func createDrink(name: String, mainSodaName: String, ingredients: [String], creator: String) {
        let newDrink = Drink(uuid: nil, name: name, mainSodaName: mainSodaName, ingredients: ingredients, creator: creator)
        FakeData.shared.drinks.append(newDrink)
    }
    
    
    var personId = ""
}
