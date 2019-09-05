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
    
    //    static func saveData(type: String, dictionary: [String: Any], completion: @escaping (Bool) -> Void) {
    //        ref.collection(type).addDocument(data: dictionary)
    //        completion(true);return
    //    }
    
    static func saveDrink(drinkName: String, type: String, dictionary: [String: Any], completion: @escaping (Bool) -> Void) {
        ref.collection(type).document(drinkName).setData(dictionary)
        completion(true);return
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
                        if !MyDrinksController.shared.myDrinks.contains(drink) {
                            MyDrinksController.shared.myDrinks.append(drink)
                        }
                    }
                }
        }
    }
    
    func saveDrinkPictureToStorage(drinkName: String, drinkImage: UIImage?) {
        if let image = drinkImage {
            let resizedImage = PhotoResizer.ResizeImage(image: image, targetSize: CGSize(width: 400, height: 400))
            let imageUUID = UUID().uuidString
            let storage = Storage.storage().reference().child(imageUUID)
            guard let uploadData = resizedImage.pngData() else { return }
            print(resizedImage.size)
            storage.putData(uploadData, metadata: nil) {(metaData, error) in
                if let error = error {
                    print("\(error.localizedDescription)")
                    return
                }
                docRef.document(drinkName).updateData(["arrayOfImageStrings" : FieldValue.arrayUnion([imageUUID])])
            }
        }
    }
    
    func fetchDrinks(completion: @escaping (Bool) -> Void) {
        docRef.getDocuments { (snapshot, error) in
            if let error = error {
                print("There was an error in \(#function) : \(error) : \(error.localizedDescription)")
                completion(false)
                return
            } else {
                guard let snapshot = snapshot else {return}
                for document in snapshot.documents {
                    guard let drink = Drink(snapshot: document) else {return}
                    if !MyDrinksController.shared.drinks.contains(drink) {
                        MyDrinksController.shared.drinks.append(drink)
                        guard let uid = UserDefaults.standard.string(forKey: "UID") else { return }
                        if drink.isLikedBy.contains(uid) {
                            drink.isLiked = true
                        }
                    }
                }
                completion(true)
            }
        }
        return
    }
    
    func addUserToLikedBy(currentDrink: String, uid: String) {
        let drinkRef = docRef.document(currentDrink)
        drinkRef.updateData(["isLikedBy" : FieldValue.arrayUnion([uid])])
    }
    
    func removeUserFromLikedBy(currentDrink: String, uid: String) {
        let drinkRef = docRef.document(currentDrink)
        drinkRef.updateData(["isLikedBy" : FieldValue.arrayRemove([uid])])
    }
    
    func removeDrinkFromDB(currentDrink: String) {
        docRef.document(currentDrink).delete()
    }
    
}
