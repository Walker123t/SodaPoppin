//
//  MyDrinksContainer.swift
//  sodaPoppin
//
//  Created by Nic Gibson on 8/19/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit

class MyDrinksContainer: UIViewController {

    @IBOutlet weak var addDrinkButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        // Do any additional setup after loading the view.
    }
    
    func setupButton() {
        addDrinkButton.layer.cornerRadius = addDrinkButton.frame.height / 3.2
        addDrinkButton.clipsToBounds = true
        addDrinkButton.layer.shadowColor = UIColor.darkGray.cgColor
        addDrinkButton.layer.shadowOffset = CGSize(width: 3.0, height: 2.0)
        addDrinkButton.layer.shadowOpacity = 0.5
        addDrinkButton.layer.shadowRadius = 4.0
        addDrinkButton.layer.masksToBounds = false
//        addDrinkButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
