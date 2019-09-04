//
//  CreateNewDrinkViewController.swift
//  sodaPoppin
//
//  Created by Nic Gibson on 8/20/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit

class CreateNewDrinkViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var drinkNameTextField: UITextField!
    @IBOutlet weak var ingredientLabel: UILabel!
    @IBOutlet weak var mainSodaNameButton: UIButton!
    
    var stringFromArray: String = ""
    var i = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(sodaNameReceived(notification:)), name: Notification.Name(rawValue: "Soda"), object: nil)
        MyDrinksController.shared.ingredients = []
        self.title = "Create New Drink"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(backTapped))
        self.navigationItem.leftBarButtonItem?.tintColor = .black
        drinkNameTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if mainSodaNameButton.currentTitle != "Select soda name..." {
            mainSodaNameButton.isUserInteractionEnabled = false
        }
        arrayToString()
    }
    
    @objc func sodaNameReceived(notification: Notification) {
        if let sodaName = notification.object {
            mainSodaNameButton.setTitle("\(sodaName)", for: .normal)
            mainSodaNameButton.setTitleColor(.black, for: .normal)
        }
    }
    
    @objc func backTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func createButtonTapped(_ sender: Any) {
        guard let drinkName = drinkNameTextField.text,
              let mainSodaName = mainSodaNameButton.title(for: .normal),
              let ingredients = ingredientLabel.text else {return}
        let drink = Drink(uuid: UUID().uuidString, name: drinkName, mainSodaName: mainSodaName, ingredients: MyDrinksController.shared.ingredients, isLikedBy: [], creator: UserDefaults.standard.string(forKey: "UID")!)
        if !MyDrinksController.shared.drinks.contains(drink) {
            MyDrinksController.shared.drinks.append(drink)
        }
        // Can force unwrap because we know they will have a UID
        FirebaseController.saveDrink(drinkName: drinkName, type: DrinkConstants.typeKey, dictionary: drink.dictionary) { (success) in
            self.navigationController?.popViewController(animated: true)
            MyDrinksController.shared.ingredients = []
        }
    }

    @IBAction func addIngredientButtonTapped(_ sender: UIButton) {
        addAlert()
    }
  
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func addAlert() {
        let notification = UIAlertController(title: "Choose Ingredient", message: nil, preferredStyle: .alert)
        let fromInventory = UIAlertAction(title: "From Inventory", style: .default) { (action) in
            self.performSegue(withIdentifier: "toSelectFromInventoryVC", sender: self)
        }
        let createNew = UIAlertAction(title: "Create New", style: .default) { (action) in
            self.performSegue(withIdentifier: "toCreateIngredientVC", sender: self)
        }
        notification.addAction(fromInventory)
        notification.addAction(createNew)
        present(notification, animated: true)
    }
    
    func arrayToString() {
        loadViewIfNeeded()
        if MyDrinksController.shared.inventory != [] {
            ingredientLabel.textColor = .black
            let ingredients = MyDrinksController.shared.ingredients
            if ingredients.count == 0 {
                stringFromArray = ""
            }
            else if ingredients.count == 1 {
                stringFromArray += "\(ingredients[0])"
                i += 1
            } else {
                stringFromArray += ", \(ingredients[i])"
                i += 1
            }
            ingredientLabel.text = stringFromArray
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

    @IBAction func sodaNameButtonTapped(_ sender: UIButton) {
        guard let vc = UIStoryboard(name: "tab3", bundle: nil).instantiateViewController(withIdentifier: "PresentSodas") as? PresentSodasViewController else { return }
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true) {
            
        }
        
    }
}

