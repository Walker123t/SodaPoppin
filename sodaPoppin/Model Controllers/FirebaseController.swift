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

let ref = Firestore.firestore()
let docRef = ref.collection("Drink")

class FirebaseController {
    
    var currentUser = Auth.auth().currentUser
    
    static let sharedInstance = FirebaseController()
    
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
    
    func fetchDrinksMadeByUser() {
        docRef.whereField("creator", isEqualTo: UserDefaults.standard.string(forKey: "UID") as Any)
            .getDocuments { (snapshot, error) in
                if let error = error {
                    print("There was an error in \(#function) : \(error) : \(error.localizedDescription)")
                    return
                } else {
                    guard let snapshot = snapshot else {return}
                    for document in snapshot.documents {
                        guard let drink = Drink(snapshot: document) else {return}
                        MyDrinksController.shared.myDrinks.append(drink)
                    }
                }
        }
    }
    
    func fetchDrinks() {
        docRef.getDocuments { (snapshot, error) in
            if let error = error {
                print("There was an error in \(#function) : \(error) : \(error.localizedDescription)")
                return
            } else {
                guard let snapshot = snapshot else {return}
                for document in snapshot.documents {
                    guard let drink = Drink(snapshot: document) else {return}
                    FakeData.shared.drinks.append(drink)
                }
            }
        }
    }
    
    func addUserToLikedBy(currentDrink: String, uid: String) {
        let drinkRef = docRef.document(currentDrink)
        drinkRef.updateData(["isLikedBy" : FieldValue.arrayUnion([uid])])
    }
    
    func removeUserFromLikedBy(currentDrink: String, uid: String) {
        let drinkRef = docRef.document(currentDrink)
        drinkRef.updateData(["isLikedBy" : FieldValue.arrayRemove([uid])])
    }
}
