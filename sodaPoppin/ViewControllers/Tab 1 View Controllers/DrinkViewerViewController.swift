//
//  DrinkViewerViewController.swift
//  sodaPoppin
//
//  Created by Trevor Walker on 9/5/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit

class DrinkViewerViewController: UIViewController {

    @IBOutlet weak var addImageButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var drinkName: UILabel!
    @IBOutlet weak var drinkImage: UIImageView!
    
    var currentDrink: Drink? = nil
    let drinkImages: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addImageButton.layer.cornerRadius = addImageButton.frame.height / 2
        setupTableView()
        tabBarController?.tabBar.isHidden = true
        guard let drink = currentDrink else {return}
        drinkName.text = drink.name
        
    }
}

extension DrinkViewerViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let drink = currentDrink else {return 0}
        return drink.ingredients.count
    }
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let drink = currentDrink else {return UITableViewCell()}
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath)
        cell.textLabel?.text = drink.ingredients[indexPath.row]
        return cell
    }
    
    
}
