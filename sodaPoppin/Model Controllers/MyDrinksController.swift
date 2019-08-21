//
//  MyDrinksController.swift
//  sodaPoppin
//
//  Created by Nic Gibson on 8/20/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import Foundation

class MyDrinksController {
    
    static var sharedInstance = MyDrinksController()
    
    var inventory: [String] = ["Grapes", "Grape Soda", "Grape Extract", "Seedless Grapes","Red Wine","Grape Jelly", "Grape Pureé"]
    
    var ingredients: [String] = []
    
}
