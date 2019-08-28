//
//  TagsCollectionViewCell.swift
//  sodaPoppin
//
//  Created by Nic Gibson on 8/26/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit

class TagsCollectionViewCell: UICollectionViewCell {

    var objectReceived: String? {
        didSet {
            reloadInputViews()
            updateViews()
        }
    }
    
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var tagLabelWidth: NSLayoutConstraint!
    
    override func awakeFromNib() {
        setUpCell()
    }
    
    func updateViews() {
        guard let object = objectReceived else {return}
        tagLabel.text = object
        if self.isSelected {
            self.contentView.backgroundColor = .black
            tagLabel.textColor = .white
        } else {
         self.contentView.backgroundColor = .white
            tagLabel.textColor = .black
        }
    }
    
    func setUpCell() {
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 5
    }
}
