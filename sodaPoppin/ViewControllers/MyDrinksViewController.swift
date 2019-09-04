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
    @IBOutlet weak var createDrinkButton: UIButton!
    
    var selectedTap: Int = 0
    var searchTerm: String = ""
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    
    var isSearching = false
    override func viewDidLoad() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
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
                let count = (MyDrinksController.shared.drinks.filter{$0.isLiked == true && searchTerm(item: $0.name)})
                return count.count
            case 1:
                return MyDrinksController.shared.drinks.filter{$0.creator == MyDrinksController.shared.personId && searchTerm(item: $0.name)}.count
            default:
                return MyDrinksController.shared.drinks.filter({searchTerm(item: $0.name)}).count
            }
        case 1:
            if MyDrinksController.shared.inventory.count == 0 {
                return 1
            } else {
                return MyDrinksController.shared.inventory.filter({searchTerm(item: $0)}).count
            }
        case 2:
            return MyDrinksController.shared.shoppingList.filter({searchTerm(item: $0.0)}).count
        default:
            return 0
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectedTap == 2 {
            MyDrinksController.shared.shoppingList[findShoppingListIndex(index: indexPath.section)!].1 = !MyDrinksController.shared.shoppingList[findShoppingListIndex(index: indexPath.section)!].1
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
            cell.selectionStyle = .none
            switch myDrinksSegment.selectedSegmentIndex{
            case 0:
                let drink = MyDrinksController.shared.drinks.filter{$0.isLiked && searchTerm(item: $0.name)}
                cell.populate(drink: drink[indexPath.section])
            case 1:
                // Populate the table view with their created drinks
                if MyDrinksController.shared.drinks.count > 0 {
                    cell.populate(drink: MyDrinksController.shared.drinks.filter{$0.creator == MyDrinksController.shared.personId}[indexPath.section])
                }
            default:
                cell.populate(drink: MyDrinksController.shared.drinks[indexPath.section])
            }
            cell.selectionStyle = .none
            cell.likeButton.isHidden = true
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "inventoryCell", for: indexPath) as? InventoryTableViewCell else {return UITableViewCell()}
            if MyDrinksController.shared.inventory.count != 0 {
                guard let inventoryIcon = UIImage(named: MyDrinksController.shared.inventory.filter({searchTerm(item: $0)})[indexPath.section]) else {return UITableViewCell()}
                cell.populate(icon: inventoryIcon, itemName: MyDrinksController.shared.inventory.filter({searchTerm(item: $0)})[indexPath.section])
            } else {
                cell.itemName.adjustsFontSizeToFitWidth = true
                cell.itemName.font = UIFont(name: "System", size: 15)
                cell.populate(icon: #imageLiteral(resourceName: "Error Icon"), itemName: "Nothing has been added to your inventory! Please delete some items from the shopping list.")
            }
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingListCell", for: indexPath)  as? ShoppingItemTableViewCell else {return UITableViewCell()}
            guard let shoppingListItemIcon = UIImage(named: "\(MyDrinksController.shared.shoppingList.filter({searchTerm(item: $0.0)})[indexPath.section].0)") else { return UITableViewCell() }
            cell.populate(icon: shoppingListItemIcon, name: MyDrinksController.shared.shoppingList.filter({searchTerm(item: $0.0)})[indexPath.section].0, doesHaveIcon: (MyDrinksController.shared.shoppingList.filter({searchTerm(item: $0.0)})[indexPath.section].1 ? #imageLiteral(resourceName: "selectedIcon"): #imageLiteral(resourceName: "unSelectedIcon")))
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
                guard let index = MyDrinksController.shared.inventory.firstIndex(of: MyDrinksController.shared.inventory.filter({searchTerm(item: $0)})[indexPath.section]) else {return}
                MyDrinksController.shared.shoppingList.append((MyDrinksController.shared.inventory[index], false))
                MyDrinksController.shared.inventory.remove(at: index)
                self.tableView.reloadData()
            case 2:
                guard let index = findShoppingListIndex(index: indexPath.section) else {return}
                MyDrinksController.shared.inventory.append(MyDrinksController.shared.shoppingList[index].0)
                MyDrinksController.shared.shoppingList.remove(at: index)
                self.tableView.reloadData()
            default:
                return
            }
        }
    }
    
    func findShoppingListIndex(index: Int) -> Int?{
        let selectItem = MyDrinksController.shared.shoppingList.filter({searchTerm(item: $0.0)})[index]
        for (index, item) in MyDrinksController.shared.shoppingList.enumerated(){
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
        searchBar.isHidden = true
        myDrinksSegment.isHidden = false
        createDrinkButton.isHidden = false
        tableView.reloadData()
    }
    
    @IBAction func myInventoryButtonTapped(_ sender: Any) {
        selectedTap = 1
        titleLabel.title = "My Inventory"
        searchBar.isHidden = false
        myDrinksSegment.isHidden = true
        createDrinkButton.isHidden = true
        tableView.reloadData()
    }
    
    @IBAction func shoppingListButtonTapped(_ sender: Any) {
        selectedTap = 2
        titleLabel.title = "My Shopping List"
        searchBar.isHidden = false
        myDrinksSegment.isHidden = true
        createDrinkButton.isHidden = true
        tableView.reloadData()
    }
}

class SetGradient {
    
    static func setGradient(view: UIView, mainColor: UIColor, secondColor: UIColor) {
        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [mainColor.cgColor, secondColor.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: view.frame.size.width, height: view.frame.size.height)
        
        view.layer.insertSublayer(gradient, at: 0)
    }
    
}
