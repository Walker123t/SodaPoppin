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
    var shoppingList: [(String, Bool)] = [("one", true), ("two", false)]
    var drinks: [Drink] = [Drink(uuid: "", name: "Psycho's Dream", mainSodaName: "Sprite", ingredients: ["Pineapple","Blueberry","Coconut"], isLikedBy: [], creator: "129857125"), Drink(uuid: "", name: "Mixed Medly", mainSodaName: "Dr. Pepper", ingredients: ["Pineapple","Blueberry","Coconut" , "Guava","Lavendar","Rasberry"], isLikedBy: [], creator: "209875109"), Drink(uuid: "", name: "Country Storm", mainSodaName: "Root Beer", ingredients: ["Rasberry","Coconut"], isLikedBy: [], creator: "2498540"), Drink(uuid: "", name: "Ol' Reliable", mainSodaName: "Coke", ingredients: ["Pineapple","Blueberry","Coconut"], isLikedBy: [], creator: "1201341324")]
    
    
    func createDrink(name: String, mainSodaName: String, ingredients: [String], creator: String) {
        let newDrink = Drink(uuid: nil, name: name, mainSodaName: mainSodaName, ingredients: ingredients, isLikedBy: [], creator: creator)
        MyDrinksController.shared.drinks.append(newDrink)
    }
    
    func saveShoppingList(shoppingList: [String]) {
        let je = JSONEncoder()
        do {
            let data = try je.encode(shoppingList)
            try data.write(to: fileURL())
        } catch let error {
            print("Error saving shopping list \(error.localizedDescription)")
        }
    }
    
    func saveInventory(inventory: [String]) {
        let je = JSONEncoder()
        do {
            let data = try je.encode(inventory)
            try data.write(to: fileURL())
        } catch let error {
            print("Error saving shopping list \(error.localizedDescription)")
        }
    }
    
    func loadInventory() -> [String]? {
        do {
            let data = try Data(contentsOf: fileURL())
            let jd = JSONDecoder()
            let inventory = try jd.decode([String].self, from: data)
            return inventory
        } catch let e {
            print("Error loading json from disk \(e)")
        }
        return nil
    }
    
    func loadShoppingList() -> [String]? {
        do {
            let data = try Data(contentsOf: fileURL())
            let jd = JSONDecoder()
            let shoppingList = try jd.decode([String].self, from: data)
            return shoppingList
        } catch let error {
            print("Error loading shopping list json from disk \(error)")
        }
        return nil
    }
    
    func fileURL() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        let filename = "loves.json"
        let fullURL = documentsDirectory.appendingPathComponent(filename)
        return fullURL
    }
    
    var personId = ""
}
