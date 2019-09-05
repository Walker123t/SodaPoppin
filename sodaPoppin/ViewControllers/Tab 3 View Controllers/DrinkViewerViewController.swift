//
//  DrinkViewerViewController.swift
//  sodaPoppin
//
//  Created by Trevor Walker on 9/5/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit

class DrinkViewerViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var drinkName: UILabel!
    @IBOutlet weak var drinkImage: UIImageView!
    
    let currentDrink: Drink? = nil
    let drinkImages: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        tabBarController?.tabBar.isHidden = true
        guard let drink = currentDrink else {return}
        drinkName.text = drink.name
        
    }
}

extension DrinkViewerViewController: UITableViewDelegate, UITableViewDataSource{
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    
    
}
