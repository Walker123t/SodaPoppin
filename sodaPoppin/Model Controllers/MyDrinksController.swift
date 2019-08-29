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
    
    func createDrink(name: String, mainSodaName: String, ingredients: [String], notes: String) {
        
        let newDrink = Drink(uuid: nil, name: name, mainSodaName: mainSodaName, ingredients: ingredients, notes: notes)
        FakeData.shared.drinks.append(newDrink)
    }
    
    
    var personId = ""
}
