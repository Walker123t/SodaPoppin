//
//  MyDrinksViewController.swift
//  sodaPoppin
//
//  Created by Nic Gibson on 8/19/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit

class MyDrinksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    @IBOutlet weak var titleLabel: UINavigationItem!
    @IBOutlet weak var myDrinksButton: UIButton!
    @IBOutlet weak var myInventoryButton: UIButton!
    @IBOutlet weak var shoppingListButton: UIButton!
    @IBOutlet weak var drinksTableView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var myDrinksSegment: UISegmentedControl!
    
    var selectedTap: Int = 0
    var tableData: Any = []
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
        return UITableView.automaticDimension
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
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            switch selectedTap {
            case 0:
                FakeData.shared.drinks.remove(at: indexPath.row)
            case 1:
                FakeData.shared.inventory.remove(at: indexPath.row)
            case 2:
                FakeData.shared.shoppingList.remove(at: indexPath.row)
            default:
                return
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    @IBAction func myDrinksButtonTapped(_ sender: Any) {
        selectedTap = 0
        titleLabel.title = "My Drinks"
        //myDrinksSegment.isHidden = false
        tableView.reloadData()
    }
    
    @IBAction func myInventoryButtonTapped(_ sender: Any) {
        selectedTap = 1
        titleLabel.title = "My Inventory"
        //myDrinksSegment.isHidden = true
        tableView.reloadData()
    }
    
    @IBAction func shoppingListButtonTapped(_ sender: Any) {
        selectedTap = 2
        titleLabel.title = "My Shopping List"
        //myDrinksSegment.isHidden = true
        tableView.reloadData()
    }
    
    func populateTableData(selectedTab: Int, segmentIndex: Int){
        switch selectedTab {
        case 0:
            switch segmentIndex {
            case 0:
                tableData = FakeData.shared.drinks.filter{$0.isLiked ?? false}
            case 1:
                tableData = FakeData.shared.drinks.filter{$0.creator == MyDrinksController.shared.personID}
        case 1:
            FakeData.shared.inventory.remove(at: indexPath.row)
        case 2:
            FakeData.shared.shoppingList.remove(at: indexPath.row)
        default:
            return
        }
    }
    
}
