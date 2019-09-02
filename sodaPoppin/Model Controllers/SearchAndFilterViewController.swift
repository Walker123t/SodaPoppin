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
    
    func search(searchTerm: String) -> [Drink] {
        var tempArray: [Drink] = []
        for soda in MyDrinksController.shared.drinks {
            if soda.name.contains(searchTerm){
                let notFoundList = MyDrinksController.shared.selectedTags.filter{!soda.ingredients.contains($0)}
                if notFoundList.count != MyDrinksController.shared.selectedTags.count{
                    tempArray.append(soda)
                }
            }
        }
        return tempArray
    }
    
    func onlyInventory(sodaList: [Drink], inventory: [String]) -> [Drink]{
        var tempArray: [Drink] = []
        for soda in sodaList {
            let notFoundList = soda.ingredients.filter{!inventory.contains($0)}
            if notFoundList.count == 0{
                tempArray.append(soda)
            }
        }
        return tempArray
    }
    
    func likedDrinks(drinks: [Drink]) -> [Drink]{
        var filtered: [Drink] = []
        for drink in drinks {
            if drink.isLiked ?? false {
                filtered.append(drink)
            }
        }
        return filtered
    }
    
}
