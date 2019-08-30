//
//  Drink.swift
//  sodaPoppin
//
//  Created by Trevor Walker on 8/14/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit
import Firebase

class Drink {
    
    let uuid: String
    var name: String
    var mainSodaName: String
    var ingredients: [String]
    var isLiked: Bool = false
    var isLikedBy: [String] = []
    var creator: String
    var dictionary: [String:Any] {
        return [
        DrinkConstants.uuidKey : self.uuid,
        DrinkConstants.nameKey : self.name,
        DrinkConstants.mainSodaNameKey : self.mainSodaName,
        DrinkConstants.ingreidentsKey : self.ingredients,
        DrinkConstants.isLikedByKey : self.isLikedBy,
        DrinkConstants.creatorKey : self.creator
        ]
    }
    
    init(uuid: String?, name: String, mainSodaName: String, ingredients: [String], isLikedBy: [String], creator: String) {
        self.uuid = uuid ?? UUID().uuidString
        self.name = name
        self.mainSodaName = mainSodaName
        self.ingredients = ingredients
        self.isLikedBy = isLikedBy
        self.creator = creator
    }
    
    init?(snapshot: DocumentSnapshot) {
        let snapshot = snapshot.data()
        guard let uuid = snapshot?[DrinkConstants.uuidKey] as? String,
              let name = snapshot?[DrinkConstants.nameKey] as? String,
              let mainSodaName = snapshot?[DrinkConstants.mainSodaNameKey] as? String,
              let ingredients = snapshot?[DrinkConstants.ingreidentsKey] as? [String],
              let isLikedBy = snapshot?[DrinkConstants.isLikedByKey] as? [String],
              let creator = snapshot?[DrinkConstants.creatorKey] as? String
            else { return nil }
        
        self.name = name
        self.mainSodaName = mainSodaName
        self.ingredients = ingredients
        self.creator = creator
        self.uuid = uuid
        self.isLikedBy = isLikedBy
    }
}

extension Drink: Equatable{
    static func == (lhs: Drink, rhs: Drink) -> Bool {
        if lhs.uuid == rhs.uuid{
            return true
        }
        return false
    }
}

struct DrinkConstants {
    static let typeKey = "Drink"
    fileprivate static let uuidKey = "uuid"
    fileprivate static let nameKey = "name"
    fileprivate static let mainSodaNameKey = "mainSodaName"
    fileprivate static let ingreidentsKey = "ingredients"
    fileprivate static let isLikedByKey = "isLikedBy"
    fileprivate static let creatorKey = "creator"
}
