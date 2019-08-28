//
//  SelectFromInventoryViewController.swift
//  sodaPoppin
//
//  Created by Nic Gibson on 8/20/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit

class SelectFromInventoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let fakeData = FakeData()
    @IBOutlet weak var inventoryTableView: UITableView!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fakeData.inventory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.inventoryTableView.dequeueReusableCell(withIdentifier: "inventoryCell", for: indexPath)
        let inventoryItem = fakeData.inventory[indexPath.row]
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
              let ingredientToAdd = fakeData.inventory[index.row]
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
