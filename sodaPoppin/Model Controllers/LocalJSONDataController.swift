//
//  LocalJSONDataController.swift
//  sodaPoppin
//
//  Created by Nic Gibson on 8/29/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import Foundation

class LocalJSONDataController {
    
    struct Loves : Codable {
        var text : String
        var count : Int
    }
    
    var loves = Loves(text: "Lova Ya", count: 2)
    
    func saveLoves(loves : Loves) {
        let je = JSONEncoder()
        do {
            let data = try je.encode(loves)
            try data.write(to: fileURL())
        } catch let e {
            print("Error saving loves \(e)")
        }
    }
    
    func loadLoves() -> Loves? {
        do {
            let data = try Data(contentsOf: fileURL())
            let jd = JSONDecoder()
            let loves = try jd.decode(Loves.self, from: data)
            return loves
        } catch let e {
            print("Error loading json from disk \(e)")
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
    
}
