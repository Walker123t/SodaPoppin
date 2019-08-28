//
//  SearchAndFilterViewController.swift
//  sodaPoppin
//
//  Created by Trevor Walker on 8/23/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import Foundation

class SearchAndFilterViewController {
    
    static let shared = SearchAndFilterViewController()
    
    func search(searchTerm: String, sodaList: [Drink], filter: [String]) -> [Drink] {
        var returnedArray: [Drink] = []
        for soda in sodaList {
            if soda.name.contains(searchTerm) {
                for ingredient in filter {
                    if !(soda.ingredients.contains(ingredient)){
                        returnedArray.append(soda)
                    }
                }
            }
        }
        return returnedArray
    }
    
}
