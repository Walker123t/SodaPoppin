//
//  MyDrinksController.swift
//  sodaPoppin
//
//  Created by Nic Gibson on 8/20/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import Foundation

class MyDrinksController {
    
<<<<<<< HEAD
    static let shared = MyDrinksController()
    
    let fakeData = FakeData()
    func createDrink(name: String, ingredients: [String], notes: String) {
        
        let newDrink = Drink(uuid: nil, name: name, ingredients: ingredients, notes: notes)
        fakeData.drinks.append(newDrink)
    }
=======
    static var sharedInstance = MyDrinksController()
    
    var inventory: [String] = ["Grapes", "Grape Soda", "Grape Extract", "Seedless Grapes","Red Wine","Grape Jelly", "Grape Pureé"]
    
    var ingredients: [String] = []
    
>>>>>>> 153ee70b49be5472f5d5dc4eac71d302a42c50a0
    
    
}
