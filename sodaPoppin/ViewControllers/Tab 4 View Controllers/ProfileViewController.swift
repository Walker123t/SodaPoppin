//
//  ProfileViewController.swift
//  sodaPoppin
//
//  Created by Nic Gibson on 8/21/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let fakeData = FakeData()
    
    @IBOutlet weak var profileImageViewOnView: UIView!
    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var myGoToTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: "DrinklTableViewCell", bundle: nil)
        profilePictureImageView.layer.cornerRadius = profilePictureImageView.frame.height / 2
        profilePictureImageView.image = fakeData.currentUser.userImage
        myGoToTableView.delegate = self
        myGoToTableView.dataSource = self
        myGoToTableView.register(cellNib, forCellReuseIdentifier: "drinkCell")
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "drinkCell", for: indexPath) as? DrinklTableViewCell else {return UITableViewCell()}
        cell.selectionStyle = .none
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowRadius = 10
        cell.layer.cornerRadius = cell.frame.height / 10
        cell.clipsToBounds = true
        cell.populate(drink: fakeData.currentUser.favoriteDrink)
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
