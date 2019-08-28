//
//  SelectFromInventoryViewController.swift
//  sodaPoppin
//
//  Created by Nic Gibson on 8/20/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit

class SelectFromInventoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
<<<<<<< HEAD
    let fakeData = FakeData()
    @IBOutlet weak var inventoryTableView: UITableView!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fakeData.inventory.count
=======
    @IBOutlet weak var inventoryTableView: UITableView!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MyDrinksController.sharedInstance.inventory.count
>>>>>>> 153ee70b49be5472f5d5dc4eac71d302a42c50a0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.inventoryTableView.dequeueReusableCell(withIdentifier: "inventoryCell", for: indexPath)
<<<<<<< HEAD
        let inventoryItem = fakeData.inventory[indexPath.row]
=======
        let inventoryItem = MyDrinksController.sharedInstance.inventory[indexPath.row]
>>>>>>> 153ee70b49be5472f5d5dc4eac71d302a42c50a0
        cell.textLabel?.text = inventoryItem
        return cell
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        inventoryTableView.delegate = self
        inventoryTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addToRecipeButtonTapped(_ sender: Any) {
        guard let index = inventoryTableView.indexPathForSelectedRow else {return}
<<<<<<< HEAD
              let ingredientToAdd = fakeData.inventory[index.row]
=======
              let ingredientToAdd = MyDrinksController.sharedInstance.inventory[index.row]
        MyDrinksController.sharedInstance.ingredients.append(ingredientToAdd)
>>>>>>> 153ee70b49be5472f5d5dc4eac71d302a42c50a0
        navigationController?.popViewController(animated: true)
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
