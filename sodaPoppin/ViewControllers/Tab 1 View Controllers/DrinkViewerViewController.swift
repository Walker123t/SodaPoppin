//
//  DrinkViewerViewController.swift
//  sodaPoppin
//
//  Created by Trevor Walker on 9/5/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit

class DrinkViewerViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var addImageButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var drinkName: UILabel!
    @IBOutlet weak var drinkImage: UIImageView!
    
    var currentDrink: Drink? = nil
    var selectedImage: UIImage? {
        didSet {
            guard let image = selectedImage else {return}
            drinkImages.append(image)
        }
    }
    var drinkImages: [UIImage] = []
    var currentImageIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addImageButton.layer.cornerRadius = addImageButton.frame.height / 2
        nextButton.layer.cornerRadius = addImageButton.frame.height / 2
        backButton.layer.cornerRadius = backButton.frame.height / 2
        setupTableView()
        tabBarController?.tabBar.isHidden = true
        guard let drink = currentDrink else {return}
        drinkName.text = drink.name
        backButton.isEnabled = false
        for name in drink.arrayOfImageStrings{
            FirebaseController.sharedInstance.loadProfileImageView(imageUUID: name) { (image) in
                if let image = image{
                    self.drinkImages.append(image)
                    if self.drinkImages.count > 0 {
                        self.drinkImage.image = self.drinkImages[0]
                    }
                }
            }
        }
    }
    @IBAction func addImage(_ sender: Any) {
        guard let drink = currentDrink else {return}
        presentImagePickerActionSheet()
        FirebaseController.sharedInstance.saveDrinkPictureToStorage(drinkName: drink.name, drinkImage: selectedImage)
        setImage()
    }
    @IBAction func nextButton(_ sender: Any) {
        currentImageIndex += 1
        setImage()
    }
    @IBAction func backButton(_ sender: Any) {
        currentImageIndex -= 1
        setImage()
    }
    
    func setImage() {
        if currentImageIndex == 0 {
            backButton.isEnabled = false
            nextButton.isEnabled = true
            drinkImage.image = drinkImages[currentImageIndex]
        } else if currentImageIndex == drinkImages.count - 1{
            nextButton.isEnabled = false
            backButton.isEnabled = true
            drinkImage.image = drinkImages[currentImageIndex]
        } else {
            backButton.isEnabled = true
            nextButton.isEnabled = true
            drinkImage.image = drinkImages[currentImageIndex]
        }
        print(currentImageIndex)
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
        guard let drink = currentDrink, let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath) as? InventoryTableViewCell, let icon = UIImage(named: drink.ingredients[indexPath.row]) else {return UITableViewCell()}
        let ingredient =  drink.ingredients[indexPath.row]
        cell.populate(icon: icon, itemName: ingredient)
        return cell
    }
    
    
}
extension DrinkViewerViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let photo = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            selectedImage = photo
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func presentImagePickerActionSheet() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
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
