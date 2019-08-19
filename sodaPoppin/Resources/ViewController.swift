//
//  ViewController.swift
//  sodaPoppin
//
//  Created by Trevor Walker on 8/14/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    let db = Firestore.firestore()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        class user {
            var name: String
            var email: String
            var username: String
            var userDict: [String:Any] {
                return [
                    "name" : self.name,
                    "email" : self.email,
                    "username" : self.username
                ]
            }
            init(name: String, email: String, username: String) {
                self.name = name
                self.email = email
                self.username = username
            }
        }
        
        var nic = user(name: "nic", email: "nic@shpangy.com", username: "nicx911")
        
        FirebaseController.saveData(type: "users", dictionary: nic.userDict) { (success) in
            
        }
    FirebaseController.getData(type: "users")
    }
}

