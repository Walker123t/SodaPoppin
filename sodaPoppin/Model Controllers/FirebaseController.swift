//
//  FirebaseController.swift
//  sodaPoppin
//
//  Created by Nic Gibson on 8/14/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

// Create
let ref = Firestore.firestore()

class FirebaseController {
    
    var currentUser = Auth.auth().currentUser
    
    static func saveData(type: String, dictionary: [String: Any], completion: @escaping (Bool) -> Void) {
        ref.collection(type).addDocument(data: dictionary)
        completion(true);return
    }
    
    func signIn(email: String, password: String, completion: @escaping (String) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("There was an error in \(#function) : \(error) : \(error.localizedDescription)")
                completion("")
                return
            }
            
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Error signing out")
        }
    }
    
    func createUser(email: String, password: String, completion: @escaping (String) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (data, error) in
            if let error = error {
                print("There was an error in \(#function) : \(error) : \(error.localizedDescription)")
                completion("")
                return
            }
            guard let userID = data?.user.uid else {completion("");return}
            self.currentUser = data?.user
            print("User authenticated successfully")
            completion(userID)
        }
    }
    
    static func getData(type: String) {
        ref.collection(type).getDocuments() {(querySnapshot, error) in
            if let _ = error {
                print("error getting snaps")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    print("\(document.data().first?.key)")
                }
            }
        }
    }
}
