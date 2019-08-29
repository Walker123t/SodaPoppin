//
//  CreateNewDrinkViewController.swift
//  sodaPoppin
//
//  Created by Nic Gibson on 8/20/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit

class CreateNewDrinkViewController: UIViewController {

    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet weak var ingredientLabel: UILabel!
    
    var stringFromArray: String = ""
    var i = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Create New Drink"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(backTapped))
        self.navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    @objc func backTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        arrayToString()
    }
    
    @IBAction func createButtonTapped(_ sender: Any) {
        
    }

    @IBAction func addIngredientButtonTapped(_ sender: UIButton) {
        addAlert()
    }
    
    func addAlert() {
        let notification = UIAlertController(title: "Choose Ingredient", message: nil, preferredStyle: .alert)
        let fromInventory = UIAlertAction(title: "From Inventory", style: .default) { (action) in
            self.performSegue(withIdentifier: "toSelectFromInventoryVC", sender: self)
        }
        let createNew = UIAlertAction(title: "Create New", style: .default) { (action) in
            self.performSegue(withIdentifier: "toCreateIngredientVC", sender: self)
        }
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        notification.addAction(fromInventory)
        notification.addAction(createNew)
//        notification.addAction(cancelAction)
        present(notification, animated: true)
    }
    
    func arrayToString() {
        loadViewIfNeeded()
        if FakeData.shared.inventory != [] {
            ingredientLabel.textColor = .black
            let ingredients = FakeData.shared.inventory
            if ingredients.count == 1 {
                stringFromArray += "\(ingredients[i])"
            } else {
                stringFromArray += ", \(ingredients[i])"
            }
            ingredientLabel.text = stringFromArray
            i += 1
        }
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
