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
        
        FirebaseController.sharedInstance.addData()
        FirebaseController.sharedInstance.getData()
    }
}

