//
//  DrinkViewerViewController.swift
//  sodaPoppin
//
//  Created by Trevor Walker on 9/5/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit

class DrinkViewerViewController: UIViewController {

    @IBOutlet weak var addImageButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var drinkName: UILabel!
    @IBOutlet weak var drinkImage: UIImageView!
    
    var currentDrink: Drink? = nil
    let drinkImages: [UIImage] = []
    var currentImageIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addImageButton.layer.cornerRadius = addImageButton.frame.height / 2
        setupTableView()
        tabBarController?.tabBar.isHidden = true
        guard let drink = currentDrink else {return}
        drinkName.text = drink.name
        
        if drinkImages.count > 0 {
            drinkImage.image = drinkImages[0]
        }
        
    }
    @IBAction func addImage(_ sender: Any) {
        presentImagePickerActionSheet()
    }
    @IBAction func swipeDetected(_ sender: UISwipeGestureRecognizer) {
        print("SwippedRight")
    }
    @IBAction func swipeLeft(_ sender: Any) {
        print("Swipped Left")
    }
}

extension DrinkViewerViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let drink = currentDrink else {return 0}
        return drink.ingredients.count
    }
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let drink = currentDrink else {return UITableViewCell()}
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath)
        cell.textLabel?.text = drink.ingredients[indexPath.row]
        return cell
    }
    
    
}
extension DrinkViewerViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let photo = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func presentImagePickerActionSheet() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        let actionSheet = UIAlertController(title: "Select a Photo", message: nil, preferredStyle: .actionSheet)
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            actionSheet.popoverPresentationController?.sourceView = self.view
            actionSheet.popoverPresentationController?.sourceRect = CGRect(x: 50, y: self.view.frame.height - 100, width: self.view.frame.width - 100, height: 100)
            actionSheet.addAction(UIAlertAction(title: "Photos", style: .default, handler: { (_) in
                imagePickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
                self.present(imagePickerController, animated: true, completion: nil)
            }))
        }
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            actionSheet.popoverPresentationController?.sourceView = self.view
            actionSheet.popoverPresentationController?.sourceRect = CGRect(x: 50, y: self.view.frame.height - 100, width: self.view.frame.width - 100, height: 100)
            actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (_) in
                imagePickerController.sourceType = UIImagePickerController.SourceType.camera
                self.present(imagePickerController, animated: true, completion: nil)
            }))
        }
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(actionSheet, animated: true)
    }
}
