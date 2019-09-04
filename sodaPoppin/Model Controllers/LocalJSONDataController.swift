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
    
    func saveShoppingList(shoppingList: [[String:Bool]?]) {
        let je = JSONEncoder()
        do {
            let data = try je.encode(shoppingList)
            try data.write(to: fileURL())
        } catch let e {
            print("Error saving loves \(e)")
        }
    }
    
    func loadShoppingList() -> [[String:Bool]?] {
        do {
            let data = try Data(contentsOf: fileURL())
            let jd = JSONDecoder()
            let inventoryAndShoppingList = try jd.decode([[String:Bool]?].self, from: data)
            return inventoryAndShoppingList
        } catch let e {
            print("Error loading json from disk \(e)")
        }
        return []
    }
    
    func fileURL() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        let filename = "loves.json"
        let fullURL = documentsDirectory.appendingPathComponent(filename)
        return fullURL
    }
    
}
