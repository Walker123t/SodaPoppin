//
//  MyDrinksViewController.swift
//  sodaPoppin
//
//  Created by Nic Gibson on 8/19/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit

class MyDrinksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    @IBOutlet weak var myDrinksButton: UIButton!
    @IBOutlet weak var myInventoryButton: UIButton!
    @IBOutlet weak var shoppingListButton: UIButton!
    @IBOutlet weak var drinksTableView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var myDrinksSegment: UISegmentedControl!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var selectedTap: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        let cellNib = UINib(nibName: "DrinklTableViewCell", bundle: nil)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(cellNib, forCellReuseIdentifier: "drinkCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch selectedTap {
        case 0:
            return FakeData.shared.drinks.count
        case 1:
            return FakeData.shared.inventory.count
        case 2:
            return FakeData.shared.shoppingList.count
        default:
            return 0
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch selectedTap {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "drinkCell", for: indexPath) as? DrinklTableViewCell else {return UITableViewCell()}
            cell.selectionStyle = .none
            cell.layer.cornerRadius = 5
            cell.clipsToBounds = true
            cell.populate(drink: FakeData.shared.drinks[indexPath.section])
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "inventoryCell", for: indexPath) as UITableViewCell
            cell.textLabel?.text = FakeData.shared.inventory[indexPath.row]
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingListCell", for: indexPath) as UITableViewCell
            cell.textLabel?.text = FakeData.shared.shoppingList[indexPath.row].0
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    @IBAction func myDrinksButtonTapped(_ sender: Any) {
        selectedTap = 0
        searchBar.isHidden = true
        myDrinksSegment.isHidden = false
        tableView.reloadData()
    }
    
    @IBAction func myInventoryButtonTapped(_ sender: Any) {
        selectedTap = 1
        searchBar.isHidden = false
        myDrinksSegment.isHidden = true
        tableView.reloadData()
    }
    
    @IBAction func shoppingListButtonTapped(_ sender: Any) {
        selectedTap = 2
        searchBar.isHidden = false
        myDrinksSegment.isHidden = true
        tableView.reloadData()
    }
    
}
