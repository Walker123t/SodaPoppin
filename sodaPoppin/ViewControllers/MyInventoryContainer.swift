//
//  MyInventoryContainer.swift
//  sodaPoppin
//
//  Created by Nic Gibson on 8/19/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit

class MyInventoryContainer: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let fakeData = FakeData()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fakeData.inventory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myInventoryTableView.dequeueReusableCell(withIdentifier: "myInventoryCell", for: indexPath)
        let inventoryItem = fakeData.inventory[indexPath.row]
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
