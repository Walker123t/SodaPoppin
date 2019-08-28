//
//  TagsCollectionViewCell.swift
//  sodaPoppin
//
//  Created by Nic Gibson on 8/26/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit

class TagsCollectionViewCell: UICollectionViewCell {
<<<<<<< HEAD

    var objectReceived: String? {
        didSet {
            reloadInputViews()
            updateViews()
        }
    }
=======
    
    var isChosen = false
>>>>>>> 153ee70b49be5472f5d5dc4eac71d302a42c50a0
    
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var tagLabelWidth: NSLayoutConstraint!
    
    override func awakeFromNib() {
        setUpCell()
    }
    
<<<<<<< HEAD
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
=======
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
>>>>>>> 153ee70b49be5472f5d5dc4eac71d302a42c50a0
    }
    
    func setUpCell() {
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 5
    }
}
