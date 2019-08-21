//
//  ProfileViewController.swift
//  sodaPoppin
//
//  Created by Nic Gibson on 8/21/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "myGoTo")
        cell.textLabel?.text = "I LIKE HAM"
        return cell
    }
    

    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var myGoToTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profilePictureImageView.layer.cornerRadius = profilePictureImageView.frame.height / 2
        myGoToTableView.delegate = self
        myGoToTableView.dataSource = self
        // Do any additional setup after loading the view.
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
