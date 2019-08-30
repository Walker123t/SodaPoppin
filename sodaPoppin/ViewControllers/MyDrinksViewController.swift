//
//  MyDrinksViewController.swift
//  sodaPoppin
//
//  Created by Nic Gibson on 8/19/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit

class MyDrinksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var titleLabel: UINavigationItem!
    @IBOutlet weak var myDrinksButton: UIButton!
    @IBOutlet weak var myInventoryButton: UIButton!
    @IBOutlet weak var shoppingListButton: UIButton!
    @IBOutlet weak var drinksTableView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var myDrinksSegment: UISegmentedControl!
    @IBOutlet weak var searchBar: UITextField!
    
    var selectedTap: Int = 0
    var searchTerm: String = ""
    
    var isSearching = false
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        let cellNib = UINib(nibName: "DrinklTableViewCell", bundle: nil)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(cellNib, forCellReuseIdentifier: "drinkCell")
        
        searchBar.delegate = self
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string != ""{
            searchTerm += string
        } else {
            searchTerm.removeLast()
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func searchTerm(item: String) -> Bool{
        if searchTerm == ""{
            return true
        }
        print(searchTerm)
        return item.contains(searchTerm)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        switch selectedTap {
        case 0:
            switch myDrinksSegment.selectedSegmentIndex{
            case 0:
                let count = (FakeData.shared.drinks.filter{$0.isLiked == true && searchTerm(item: $0.name)})
                return count.count
            case 1:
                return FakeData.shared.drinks.filter{$0.creator == MyDrinksController.shared.personId && searchTerm(item: $0.name)}.count
            default:
                return FakeData.shared.drinks.filter({searchTerm(item: $0.name)}).count
            }
        case 1:
            return FakeData.shared.inventory.filter({searchTerm(item: $0)}).count
        case 2:
            return FakeData.shared.shoppingList.filter({searchTerm(item: $0.0)}).count
        default:
            return 0
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch selectedTap {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "drinkCell", for: indexPath) as? DrinklTableViewCell else {print("dun broke"); return UITableViewCell()}
            cell.selectionStyle = .none
            cell.layer.cornerRadius = 5
            cell.clipsToBounds = true
            switch myDrinksSegment.selectedSegmentIndex{
            case 0:
                let drink = FakeData.shared.drinks.filter{$0.isLiked && searchTerm(item: $0.name)}
                cell.populate(drink: drink[indexPath.section])
            case 1:
                // Populate the table view with their created drinks
                FirebaseController.sharedInstance.fetchDrinksMadeByUser()
                if MyDrinksController.shared.myDrinks.count > 0 {
                    cell.populate(drink: MyDrinksController.shared.myDrinks[indexPath.row])
                }
            //                    cell.populate(drink: FakeData.shared.drinks.filter{$0.creator == MyDrinksController.shared.personId}[indexPath.section])
            default:
                cell.populate(drink: FakeData.shared.drinks[indexPath.section])
            }
            cell.likeButton.isHidden = true
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "inventoryCell", for: indexPath) as? InventoryTableViewCell else {return UITableViewCell()}
            cell.populate(icon: #imageLiteral(resourceName: "Rasberry"), itemName: FakeData.shared.inventory.filter({searchTerm(item: $0)})[indexPath.section])
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingListCell", for: indexPath)  as? ShoppingItemTableViewCell else {return UITableViewCell()}
            cell.populate(icon: #imageLiteral(resourceName: "Rasberry"), name: FakeData.shared.shoppingList.filter({searchTerm(item: $0.0)})[indexPath.section].0, doesHaveIcon: (FakeData.shared.shoppingList.filter({searchTerm(item: $0.0)})[indexPath.section].1 ? #imageLiteral(resourceName: "unlikedIcon"): #imageLiteral(resourceName: "Blood Orange")))
            return cell
        default:
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            switch selectedTap {
            case 0:
                return
            case 1:
                FakeData.shared.inventory.remove(at: FakeData.shared.inventory.firstIndex(of: FakeData.shared.inventory.filter({searchTerm(item: $0)})[indexPath.section])!)
            case 2:
                FakeData.shared.shoppingList.remove(at: findShoppingListIndex(index: indexPath.section)!)
            default:
                return
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    func findShoppingListIndex(index: Int) -> Int?{
        let selectItem = FakeData.shared.shoppingList.filter({searchTerm(item: $0.0)})[index]
        for (index, item) in FakeData.shared.shoppingList.enumerated(){
            if selectItem == item{
                return index
            }
        }
        return nil
    }
    
    @IBAction func segmentController(_ sender: Any) {
        tableView.reloadData()
    }
    
    @IBAction func myDrinksButtonTapped(_ sender: Any) {
        selectedTap = 0
        titleLabel.title = "My Drinks"
        myDrinksSegment.isHidden = false
        tableView.reloadData()
    }
    
    @IBAction func myInventoryButtonTapped(_ sender: Any) {
        selectedTap = 1
        titleLabel.title = "My Inventory"
        myDrinksSegment.isHidden = true
        tableView.reloadData()
    }
    
    @IBAction func shoppingListButtonTapped(_ sender: Any) {
        selectedTap = 2
        titleLabel.title = "My Shopping List"
        myDrinksSegment.isHidden = true
        tableView.reloadData()
    }
}
