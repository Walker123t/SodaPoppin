//
//  ShoppingListContainer.swift
//  sodaPoppin
//
//  Created by Nic Gibson on 8/19/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit

class ShoppingListContainer: UIViewController {

    @IBOutlet weak var shoppingListSearchBar: UISearchBar!
    @IBOutlet weak var addToInventoryButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addToInventoryButton.layer.borderWidth = 1
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addToInventoryButtonTapped(_ sender: Any) {
        
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
