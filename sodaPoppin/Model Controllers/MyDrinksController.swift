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
    
    let fakeData = FakeData()
    func createDrink(name: String, ingredients: [String], notes: String) {
        
        let newDrink = Drink(uuid: nil, name: name, ingredients: ingredients, notes: notes)
        fakeData.drinks.append(newDrink)
    }
    
    
    
}
