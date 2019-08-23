//
//  MyDrinksViewController.swift
//  sodaPoppin
//
//  Created by Nic Gibson on 8/19/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit

class MyDrinksViewController: UIViewController {

    @IBOutlet weak var myDrinksButton: UIButton!
    @IBOutlet weak var myDrinksUnderline: UIView!
    @IBOutlet weak var myInventoryButton: UIButton!
    @IBOutlet weak var myInventoryUnderline: UIView!
    @IBOutlet weak var shoppingListButton: UIButton!
    @IBOutlet weak var shoppingListUnderline: UIView!
    @IBOutlet weak var drinksTableView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.title = "My Drinks"
        NotificationCenter.default.addObserver(self, selector: #selector(myDrinks), name: Notification.Name(rawValue: "myDrinks"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(myInventory), name: Notification.Name(rawValue: "myInventory"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(shoppingList), name: Notification.Name(rawValue: "shoppingList"), object: nil)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
    }
    
    @objc func myDrinks() {
        hideUnderlines()
        myDrinksUnderline.isHidden = false
    }
    @objc func myInventory() {
        hideUnderlines()
        myInventoryUnderline.isHidden = false
    }
    @objc func shoppingList() {
        hideUnderlines()
        shoppingListUnderline.isHidden = false
    }
    
    @IBAction func myDrinksButtonTapped(_ sender: Any) {
        hideUnderlines()
        myDrinksUnderline.isHidden = false
    }
    
    @IBAction func myInventoryButtonTapped(_ sender: Any) {
        hideUnderlines()
        myInventoryUnderline.isHidden = false
    }
    
    @IBAction func shoppingListButtonTapped(_ sender: Any) {
        hideUnderlines()
        shoppingListUnderline.isHidden = false
    }
    
    func hideUnderlines() {
        myDrinksUnderline.isHidden = true
        myInventoryUnderline.isHidden = true
        shoppingListUnderline.isHidden = true
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
