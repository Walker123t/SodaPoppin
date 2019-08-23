//
//  underlinedSegmentController.swift
//  sodaPoppin
//
//  Created by Trevor Walker on 8/22/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit

@IBDesignable
class underlinedSegmentController: UIView {
    var buttons: [UIButton] = []
    var selector: UIView!
    
    @IBInspectable
    var fontSize: Int = 20 {
        didSet {
            updateView()
        }
    }
    @IBInspectable
    var lineheight: CGFloat = 5 {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var commaSeperatedButtonTitles: String = "" {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var textColor: UIColor = .white {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var selectorColor: UIColor = .white {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        buttons = []
        subviews.forEach {$0.removeFromSuperview()}
        let buttonTitles = commaSeperatedButtonTitles.components(separatedBy: ",")
        for buttonTitle in buttonTitles {
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.titleLabel?.textAlignment = .center
            button.setTitleColor(textColor, for: .normal)
            button.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
            buttons.append(button)
        }
        
        let selectorWidth = frame.width / CGFloat(buttonTitles.count)
        selector = UIView(frame: CGRect(x: 0, y: self.frame.height, width: selectorWidth, height: lineheight))
        selector.backgroundColor = selectorColor
        addSubview(selector)
        let sv = UIStackView(arrangedSubviews: buttons)
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fillEqually
        sv.translatesAutoresizingMaskIntoConstraints = false
        addSubview(sv)
        sv.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        sv.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        sv.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        sv.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    @objc func buttonTapped(button: UIButton) {
        for (buttonIndex, btn) in buttons.enumerated() {
            btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: CGFloat(fontSize))
            btn.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(fontSize), weight: .regular)
            if btn == button {
                let selectorStartPosition = frame.width / CGFloat(buttons.count) * CGFloat(buttonIndex)
                UIView.animate(withDuration: 0.2) {
                    self.selector.frame.origin.x = selectorStartPosition
                }
                btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: CGFloat(fontSize))
            }
        }
    }
    
}
