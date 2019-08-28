//
//  MyInventoryContainer.swift
//  sodaPoppin
//
//  Created by Nic Gibson on 8/19/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit

class MyInventoryContainer: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
<<<<<<< HEAD
    let fakeData = FakeData()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fakeData.inventory.count
=======
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MyDrinksController.sharedInstance.inventory.count
>>>>>>> 153ee70b49be5472f5d5dc4eac71d302a42c50a0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myInventoryTableView.dequeueReusableCell(withIdentifier: "myInventoryCell", for: indexPath)
<<<<<<< HEAD
        let inventoryItem = fakeData.inventory[indexPath.row]
=======
        let inventoryItem = MyDrinksController.sharedInstance.inventory[indexPath.row]
>>>>>>> 153ee70b49be5472f5d5dc4eac71d302a42c50a0
        cell.textLabel?.text = inventoryItem
        return cell
    }
    
    @IBOutlet weak var myInventoryTableView: UITableView!
    @IBOutlet weak var mixNowButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myInventoryTableView.delegate = self
        myInventoryTableView.dataSource = self
        mixNowButton.layer.borderWidth = 1
        // Do any additional setup after loading the view.
    }
    
    @IBAction func mixNowButtonTapped(_ sender: Any) {
        
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
