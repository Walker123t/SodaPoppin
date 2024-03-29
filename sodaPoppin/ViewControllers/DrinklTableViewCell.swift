//
//  DrinklTableViewCell.swift
//  sodaPoppin
//
//  Created by Trevor Walker on 8/20/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit

class DrinklTableViewCell: UITableViewCell {
    
    let userUID = UserDefaults.standard.string(forKey: "UID")
    var sodaIsLiked = false
    
    @IBOutlet weak var drinkNameLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var sodaIcon: UIImageView!
    @IBOutlet weak var syrup1Icon: UIImageView!
    @IBOutlet weak var syrupIcon2: UIImageView!
    @IBOutlet weak var syrup3Icon: UIImageView!
    @IBOutlet weak var extraCountLabel: UILabel!
    
    func populate(drink: Drink){
        // Populating Soda Icon
        sodaIcon.image = UIImage(named: "\(drink.mainSodaName) Icon")
        
        // Populating Syrup Icon
        if drink.ingredients.count == 0 {
            
        } else if drink.ingredients.count == 1 {
            syrup1Icon.image = UIImage(named: "\(drink.ingredients[0])")
        } else if drink.ingredients.count == 2 {
            syrup1Icon.image = UIImage(named: "\(drink.ingredients[0])")
            syrupIcon2.image = UIImage(named: "\(drink.ingredients[1])")
        } else {
            syrup1Icon.image = UIImage(named: "\(drink.ingredients[0])")
            syrupIcon2.image = UIImage(named: "\(drink.ingredients[1])")
            syrup3Icon.image = UIImage(named: "\(drink.ingredients[2])")
        }
        
        drinkNameLabel.text = drink.name
        switch drink.ingredients.count {
        case 0 :
            syrup1Icon.isHidden = true
            syrupIcon2.isHidden = true
            syrup3Icon.isHidden = true
            extraCountLabel.isHidden = true
        case 1:
            syrup1Icon.isHidden = false
            syrupIcon2.isHidden = true
            syrup3Icon.isHidden = true
            extraCountLabel.isHidden = true
        case 2:
            syrup1Icon.isHidden = false
            syrupIcon2.isHidden = false
            syrup3Icon.isHidden = true
            extraCountLabel.isHidden = true
        case 3:
            syrup1Icon.isHidden = false
            syrupIcon2.isHidden = false
            syrup3Icon.isHidden = false
            extraCountLabel.isHidden = true
        default:
            syrup1Icon.isHidden = false
            syrupIcon2.isHidden = false
            syrup3Icon.isHidden = true
            extraCountLabel.isHidden = false
            extraCountLabel.text = "+\(drink.ingredients.count - 2)"
        }
        
        if drink.isLiked == true {
            likeButton.setImage(UIImage(named: "liked"), for: .normal)
            sodaIsLiked = true
        } else {
            likeButton.setImage(UIImage(named: "unlikedIcon"), for: .normal)
            sodaIsLiked = false
        }
    }
    
    override func awakeFromNib() {
    }
    
    @IBAction func likedButtonTapped(_ sender: Any) {
        guard let drinkName = drinkNameLabel.text else {return}
        if sodaIsLiked {
            FirebaseController.sharedInstance.removeUserFromLikedBy(currentDrink: drinkName, uid: userUID!)
            DispatchQueue.main.async {
                self.likeButton.setImage(UIImage(named: "unlikedIcon"), for: .normal)
            }
            for soda in MyDrinksController.shared.drinks {
                if soda.name.contains(drinkName) {
                    soda.isLiked = false
                }
            }
            sodaIsLiked = !sodaIsLiked
        } else {
            FirebaseController.sharedInstance.addUserToLikedBy(currentDrink: drinkName, uid: userUID!)
            DispatchQueue.main.async {
                self.likeButton.setImage(UIImage(named: "liked"), for: .normal)
            }
            for soda in MyDrinksController.shared.drinks {
                if soda.name.contains(drinkName) {
                    soda.isLiked = true
                }
            }
            sodaIsLiked = !sodaIsLiked
        }
        FirebaseController.sharedInstance.fetchDrinks { (success) in
        }
    }
}
