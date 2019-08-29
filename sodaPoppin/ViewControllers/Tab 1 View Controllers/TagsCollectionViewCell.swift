//
//  TagsCollectionViewCell.swift
//  sodaPoppin
//
//  Created by Nic Gibson on 8/26/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit

class TagsCollectionViewCell: UICollectionViewCell {
    
    var isChosen = false
    
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var tagLabelWidth: NSLayoutConstraint!
    
    override func awakeFromNib() {
        setUpCell()
    }
    
    func toggleIsChosen() {
        isChosen.toggle()
        tagLabel.backgroundColor = isChosen ? .purp : .white
        tagLabel.textColor = isChosen ? .white : .black
        self.layer.borderColor = isChosen ? UIColor.purp?.cgColor : UIColor.black.cgColor
        isUserInteractionEnabled = !isChosen
    }
    
    func updateViews(with label: String, isChosen: Bool) {
        self.isChosen = isChosen
        tagLabel.text = label
        tagLabel.backgroundColor = isChosen ? .purp : .white
        tagLabel.textColor = isChosen ? .white : .black
        self.layer.borderColor = isChosen ? UIColor.purp?.cgColor : UIColor.black.cgColor
        isUserInteractionEnabled = !isChosen
    }
    
    func setUpCell() {
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 5
    }
}
