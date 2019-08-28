//
//  SelectedTagsCollectionViewCell.swift
//  sodaPoppin
//
//  Created by Nic Gibson on 8/26/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit

class SelectedTagsCollectionViewCell: UICollectionViewCell {
    
    var selectedTag: String?
    
    @IBOutlet weak var selectedTagLabel: UILabel!
    
    override func awakeFromNib() {
        selectedTagLabel.text = selectedTag
    }
    
    @IBAction func xButtonTapped(_ sender: Any) {
        
    }
    
}
