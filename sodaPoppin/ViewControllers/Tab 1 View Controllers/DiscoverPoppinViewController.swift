//
//  DiscoverPoppinViewController.swift
//  sodaPoppin
//
//  Created by Nic Gibson on 8/26/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit

class DiscoverPoppinViewController: UIViewController {

    @IBOutlet weak var poppinButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var poppinUnderline: UIView!
    @IBOutlet weak var filterUnderline: UIView!
    @IBOutlet weak var poppinTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        poppinTableView.delegate = self
        poppinTableView.dataSource = self
        let cellNib = UINib(nibName: "DrinklTableViewCell", bundle: nil)
        poppinTableView.register(cellNib, forCellReuseIdentifier: "drinkCell")
        // To take out the line between the navigation bar and the purple view at the top of the page
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        
//        NotificationCenter.default.addObserver(self, selector: #selector(myDrinks), name: Notification.Name(rawValue: "myDrinks"), object: nil)
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func poppinButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func filterButtonTapped(_ sender: Any) {
        
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

extension DiscoverPoppinViewController: UITableViewDataSource, UITableViewDelegate {
    
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
        return FakeData.sharedInstance.drinks.count
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
        cell.populate(drink: FakeData.sharedInstance.drinks[indexPath.section])
        return cell
    }
}
