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
    var isLiked: Bool?
    var creator: String?
    var dictionary: [String:Any] {
        return [
        DrinkConstants.uuidKey : self.uuid,
        DrinkConstants.nameKey : self.name,
        DrinkConstants.mainSodaNameKey : self.mainSodaName,
        DrinkConstants.ingreidentsKey : self.ingredients,
        DrinkConstants.isLikedKey : self.isLiked,
        DrinkConstants.creatorKey : self.creator
        ]
    }
    
    init(uuid: String?, name: String, mainSodaName: String, ingredients: [String]) {
        self.uuid = uuid ?? UUID().uuidString
        self.name = name
        self.mainSodaName = mainSodaName
        self.ingredients = ingredients
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
    fileprivate static let isLikedKey = "isLiked"
    fileprivate static let creatorKey = "creator"
}
