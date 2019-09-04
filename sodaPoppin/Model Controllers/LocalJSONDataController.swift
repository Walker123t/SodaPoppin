//
//  LocalJSONDataController.swift
//  sodaPoppin
//
//  Created by Nic Gibson on 8/29/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import Foundation

class LocalJSONDataController {
    
    static let shared = LocalJSONDataController()
    
    struct Loves : Codable {
        var text : String
        var count : Int
    }
    
    func saveShoppingList(shoppingList: [String:Bool]?) {
        let je = JSONEncoder()
        do {
            let data = try je.encode(shoppingList)
            try data.write(to: fileURL(named: "shoppingList"))
        } catch let e {
            print("Error saving loves \(e)")
        }
    }
    
    func saveInventory(inventory: [String]?) {
        let je = JSONEncoder()
        do {
            let data = try je.encode(inventory)
            try data.write(to: fileURL(named: "inventory"))
        } catch let e {
            print("Error saving loves \(e)")
        }
    }
    
    func loadInventory() -> [String]? {
        do {
            let data = try Data(contentsOf: fileURL(named: "inventory"))
            let jd = JSONDecoder()
            let inventory = try jd.decode([String]?.self, from: data)
            guard let decodedInventory = inventory else {return nil}
            MyDrinksController.shared.inventory = decodedInventory
        } catch let e {
            print("Error loading json from disk \(e)")
        }
        return nil
    }
    
    func loadShoppingList() -> [(String,Bool)]? {
        do {
            let data = try Data(contentsOf: fileURL(named: "shoppingList"))
            let jd = JSONDecoder()
            
            let shoppingList = try jd.decode([String:Bool]?.self, from: data)
            var tupleArray : [(String,Bool)] = [("",false)]
            guard let guardedShoppingList = shoppingList else {return nil}
            for item in guardedShoppingList {
                tupleArray.append((item.key, item.value))
            }
            tupleArray.remove(at: 0)
            MyDrinksController.shared.shoppingList = tupleArray
        } catch let e {
            print("Error loading json from disk \(e)")
        }
        return nil
    }
    
    func fileURL(named name: String) -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        let filename = "\(name).json"
        let fullURL = documentsDirectory.appendingPathComponent(filename)
        return fullURL
    }
    
}
