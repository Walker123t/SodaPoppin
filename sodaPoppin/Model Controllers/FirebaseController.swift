//
//  FirebaseController.swift
//  sodaPoppin
//
//  Created by Nic Gibson on 8/14/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import Foundation
import Firebase

class FirebaseController {
    
    static let sharedInstance = FirebaseController()

    let ref = Firestore.firestore().collection("users")
    
    func addData() {
        
        ref.addDocument(data: [
            "name" : "big daddy",
            "username" : "big nate 69",
            "friends" : ["uuid" : "1234132412341"]
            ])
    }
    
    func getData() {
        ref.getDocuments() {(querySnapshot, error) in
            if let _ = error {
                print("error getting snaps")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
    }
    
}
