//
//  DiscoverPoppinViewController.swift
//  sodaPoppin
//
//  Created by Nic Gibson on 8/26/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit

class DiscoverPoppinViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var poppinButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var poppinUnderline: UIView!
    @IBOutlet weak var filterUnderline: UIView!
    @IBOutlet weak var poppinTableView: UITableView!
    @IBOutlet weak var searchBar: UITextField!
    
    var searchTerm: String = ""
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.poppinTableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        LocalJSONDataController.shared.loadShoppingList()
        FirebaseController.sharedInstance.fetchDrinks { (complete) in
            if complete {
                DispatchQueue.main.async {
                    self.poppinTableView.reloadData()
                }
            }
        }
        poppinTableView.delegate = self
        poppinTableView.dataSource = self
        let cellNib = UINib(nibName: "DrinklTableViewCell", bundle: nil)
        poppinTableView.register(cellNib, forCellReuseIdentifier: "drinkCell")
        // To take out the line between the navigation bar and the purple view at the top of the page
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        searchBar.delegate = self
        
        
//        NotificationCenter.default.addObserver(self, selector: #selector(myDrinks), name: Notification.Name(rawValue: "myDrinks"), object: nil)
        
        
        // Do any additional setup after loading the view.
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string != ""{
            searchTerm += string
        } else {
            searchTerm.removeLast()
        }
        DispatchQueue.main.async {
            self.poppinTableView.reloadData()
        }
        return true
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
//        searchBar.text = ""
//        searchBar.placeholder = "Search By Drink Name..."
//        searchTerm = ""
        return true
    }
    
    func searchTerm(item: String) -> Bool{
        if searchTerm == ""{
            return true
        }
        print(searchTerm)
        let lowercasedItem = item.lowercased()
        return lowercasedItem.contains(searchTerm.lowercased())
    }
    
    @IBAction func poppinButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func filterButtonTapped(_ sender: Any) {
        
    }
}

extension DiscoverPoppinViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        view.tintColor = .clear
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return MyDrinksController.shared.drinks.filter({searchTerm(item: $0.name)}).count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let editAction = UITableViewRowAction(style: .destructive, title: "Report") { (rowAction, indexPath) in
            self.poppinTableView.deleteRows(at: [indexPath], with: .fade)
            FirebaseController.sharedInstance.removeDrinkFromDB(currentDrink: MyDrinksController.shared.drinks.filter({self.searchTerm(item: $0.name)})[indexPath.row].name)
            MyDrinksController.shared.drinks.remove(at: indexPath.row)
        }
        return [editAction]
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "drinkCell", for: indexPath) as? DrinklTableViewCell else {return UITableViewCell()}
        cell.selectionStyle = .none
        cell.layer.cornerRadius = 5
        cell.clipsToBounds = true
        cell.populate(drink: MyDrinksController.shared.drinks.filter({searchTerm(item: $0.name)})[indexPath.section])
        return cell
    }
}
