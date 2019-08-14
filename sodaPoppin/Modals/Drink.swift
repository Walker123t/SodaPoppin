//
//  Drink.swift
//  sodaPoppin
//
//  Created by Trevor Walker on 8/14/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import Foundation
class soda {
    let uuid: String
    var name: String
    var ingredients: [String]
    var notes: String
    
    init(uuid: String?, name: String, ingredients: [String], notes: String){
        self.uuid = uuid ?? UUID().uuidString
        self.name = name
        self.ingredients = ingredients
        self.notes = notes
    }
}
