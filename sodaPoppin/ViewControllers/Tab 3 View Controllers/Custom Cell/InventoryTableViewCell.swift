//
//  InventoryTableViewCell.swift
//  sodaPoppin
//
//  Created by Trevor Walker on 8/29/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit

class InventoryTableViewCell: UITableViewCell {

    @IBOutlet weak var itemIcon: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    
    override func prepareForReuse() {
        itemIcon.image = nil
        itemName.text = ""
    }
    
    func populate(icon: UIImage, itemName: String){
        itemIcon.image = icon
        self.itemName.text = itemName
    }

}
