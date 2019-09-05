//
//  ShoppingItemTableViewCell.swift
//  sodaPoppin
//
//  Created by Trevor Walker on 8/29/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit

class ShoppingItemTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var doesHaveIcon: UIImageView!
    
    func populate(icon: UIImage, name: String) {
    //doesHaveIcon: UIImage){
        iconImage.image = icon
        self.name.text = name
    // self.doesHaveIcon.image = doesHaveIcon
    }
    
    override func prepareForReuse() {
        //iconImage.image = nil
       // name.text = ""
       // doesHaveIcon = nil
    }
}
