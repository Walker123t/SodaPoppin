//
//  MyDrinksContainer.swift
//  sodaPoppin
//
//  Created by Nic Gibson on 8/19/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit

class MyDrinksContainer: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let fakeData = FakeData()
    @IBOutlet weak var addDrinkButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        
        let cellNib = UINib(nibName: "DrinklTableViewCell", bundle: nil)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellNib, forCellReuseIdentifier: "drinkCell")
        
        // Do any additional setup after loading the view.
    }
    
    func setupButton() {
        addDrinkButton.layer.cornerRadius = addDrinkButton.frame.height / 3.2
        addDrinkButton.clipsToBounds = true
        addDrinkButton.layer.shadowColor = UIColor.darkGray.cgColor
        addDrinkButton.layer.shadowOffset = CGSize(width: 3.0, height: 2.0)
        addDrinkButton.layer.shadowOpacity = 0.5
        addDrinkButton.layer.shadowRadius = 4.0
        addDrinkButton.layer.masksToBounds = false
        addDrinkButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        view.tintColor = .clear
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return fakeData.drinks.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "drinkCell", for: indexPath) as? DrinklTableViewCell else {return UITableViewCell()}
        cell.selectionStyle = .none
        cell.layer.cornerRadius = 5
        cell.clipsToBounds = true
        cell.populate(drink: fakeData.drinks[indexPath.section])
        return cell
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
