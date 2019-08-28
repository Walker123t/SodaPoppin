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
    
<<<<<<< HEAD
    override func awakeFromNib() {
        selectedTagLabel.text = selectedTag
    }
    
    @IBAction func xButtonTapped(_ sender: Any) {
        
    }
    
}
=======
    weak var cellDelegate: SelectedTagsCellDelegate?
    
    override func awakeFromNib() {
        self.layer.cornerRadius = self.frame.height / 5
        self.frame.size = CGSize(width: self.selectedTagLabel.frame.width * 2, height: self.selectedTagLabel.frame.height * 2)
    }
    
    @IBAction func xButtonTapped(_ sender: Any) {
        cellDelegate?.selectedTagsCellDelegate(for: self)
    }
    
}

protocol SelectedTagsCellDelegate: class {
    func selectedTagsCellDelegate(for cell: SelectedTagsCollectionViewCell)
}
>>>>>>> 153ee70b49be5472f5d5dc4eac71d302a42c50a0
