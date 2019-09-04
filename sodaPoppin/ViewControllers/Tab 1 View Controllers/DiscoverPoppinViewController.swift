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
    
    var drinks: [Drink] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.poppinTableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseController.sharedInstance.fetchDrinks { (complete) in
            if complete {
                DispatchQueue.main.async {
                    self.drinks = MyDrinksController.shared.drinks
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
        drinks = MyDrinksController.shared.drinks
        
        if string != ""{
            searchTerm += string
        } else {
            searchTerm.removeLast()
        }
        if searchTerm != "" {
            drinks = SearchAndFilterViewController.shared.search(searchTerm: searchTerm)
        }
        DispatchQueue.main.async {
            self.poppinTableView.reloadData()
        }
        return true
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func searchTerm(item: String) -> Bool{
        if searchTerm == ""{
            return true
        }
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
        return drinks.count
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
        cell.populate(drink: drinks[indexPath.section])
        return cell
    }
}
