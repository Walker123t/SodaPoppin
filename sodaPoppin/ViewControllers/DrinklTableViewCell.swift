//
//  DrinklTableViewCell.swift
//  sodaPoppin
//
//  Created by Trevor Walker on 8/20/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit

class DrinklTableViewCell: UITableViewCell {

    @IBOutlet weak var drinkNameLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var sodaIcon: UIImageView!
    @IBOutlet weak var syrup1Icon: UIImageView!
    @IBOutlet weak var syrupIcon2: UIImageView!
    @IBOutlet weak var syrup3Icon: UIImageView!
    @IBOutlet weak var extraCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func populate(drink: Drink){
        drinkNameLabel.text = drink.name
        
    }
    
}
