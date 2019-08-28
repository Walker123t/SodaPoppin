//
//  DiscoverFilterViewController.swift
//  sodaPoppin
//
//  Created by Nic Gibson on 8/26/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit

class DiscoverFilterViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var selectedCategory: [String] = []
    var selectedTags: [String] = []
    
    var sodas: [String] = ["Mountain Dew","Coke","Sprite","Dr. Pepper","Pepsi","Cream Soda","Lemonade"]
    var syrups: [String] = ["Vanilla","Cherry","Raspberry","Blueberry","Watermelon"]
    var pureés: [String] = ["Raspberry","Cherry","Blackberry","Strawberry"]
    var other: [String] = ["Cream"]
    
    @IBOutlet weak var selectedTagsCollectionView: UICollectionView!
    @IBOutlet weak var tagsCollectionView: UICollectionView!
    @IBOutlet weak var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD
=======
        setUpSearchButton()
>>>>>>> 153ee70b49be5472f5d5dc4eac71d302a42c50a0
        selectedCategory = sodas
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sodaButtonTapped(_ sender: Any) {
        selectedCategory = sodas
        DispatchQueue.main.async {
            self.tagsCollectionView.reloadData()
        }
    }
    
    @IBAction func syrupButtonTapped(_ sender: Any) {
        selectedCategory = syrups
        DispatchQueue.main.async {
            self.tagsCollectionView.reloadData()
        }
    }
    
    @IBAction func pureéButtonTapped(_ sender: Any) {
        selectedCategory = pureés
        DispatchQueue.main.async {
            self.tagsCollectionView.reloadData()
        }
    }
    
    @IBAction func otherButtonTapped(_ sender: Any) {
        selectedCategory = other
        DispatchQueue.main.async {
            self.tagsCollectionView.reloadData()
        }
    }
    
    @IBAction func searchButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func poppinButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
    
<<<<<<< HEAD
=======
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == tagsCollectionView {
            let cell = tagsCollectionView.cellForItem(at: indexPath) as? TagsCollectionViewCell
            cell?.toggleIsChosen()
//             collectionView.reloadItems(at: [indexPath])
            let selectedItem = selectedCategory[indexPath.row]
            if !selectedTags.contains(selectedItem) {
                selectedTags.append(selectedItem)
                 selectedTagsCollectionView.reloadData()
            } else {
                return
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
    }
    
>>>>>>> 153ee70b49be5472f5d5dc4eac71d302a42c50a0
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == tagsCollectionView {
            return selectedCategory.count
        } else {
            return selectedTags.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == tagsCollectionView {
            guard let cell = tagsCollectionView.dequeueReusableCell(withReuseIdentifier: "tagCell", for: indexPath) as? TagsCollectionViewCell else { return UICollectionViewCell() }
            let object = selectedCategory[indexPath.row]
<<<<<<< HEAD
            cell.objectReceived = object
            return cell
        } else {
            guard let cell = selectedTagsCollectionView.dequeueReusableCell(withReuseIdentifier: "selectedTagCell", for: indexPath) as? SelectedTagsCollectionViewCell else { return UICollectionViewCell() }
            let tag = selectedTags[indexPath.row]
            cell.selectedTag = tag
            return cell
=======
            cell.updateViews(with: object, isChosen: selectedTags.contains(object))
            return cell
        } else {
            guard let cell = selectedTagsCollectionView.dequeueReusableCell(withReuseIdentifier: "selectedTagCell", for: indexPath) as? SelectedTagsCollectionViewCell else { return UICollectionViewCell() }
                let tag = selectedTags[indexPath.row]
                cell.selectedTagLabel.text = tag
                cell.cellDelegate = self
                return cell
>>>>>>> 153ee70b49be5472f5d5dc4eac71d302a42c50a0
        }
    }
    
    /*
<<<<<<< HEAD
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

=======
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
>>>>>>> 153ee70b49be5472f5d5dc4eac71d302a42c50a0
}

extension DiscoverFilterViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == tagsCollectionView {
            let item = selectedCategory[indexPath.row]
            let charCount = item.count
            if charCount < 10 {
                return CGSize(width: (15 * charCount), height: 23)
            } else if charCount >= 10 {
                return CGSize(width: (10 * charCount), height: 23)
            }
<<<<<<< HEAD
        }
        return CGSize(width: 20, height: 23)
    }
    

=======
        } else if collectionView == selectedTagsCollectionView {
            let item = selectedTags[indexPath.row]
            let charCount = item.count
            if charCount < 10 {
                return CGSize(width: (15 * charCount), height: 23)
            } else if charCount >= 10 {
                return CGSize(width: (12 * charCount), height: 23)
            }
        } 
        return CGSize(width: 20, height: 20)
    }
    
    
>>>>>>> 153ee70b49be5472f5d5dc4eac71d302a42c50a0
    
    func sizeThatFits(_ size: CGSize) -> CGSize {
        if (self.view != nil) {
            self.view?.layoutIfNeeded()
        }
        return tagsCollectionView.collectionViewLayout.collectionViewContentSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func setUpSearchButton() {
        searchButton.layer.cornerRadius = searchButton.frame.height / 2
        searchButton.layer.borderWidth = 1.5
        searchButton.layer.borderColor = UIColor.purp?.cgColor
    }
    
}

<<<<<<< HEAD
=======
extension DiscoverFilterViewController: SelectedTagsCellDelegate {
    
    func selectedTagsCellDelegate(for cell: SelectedTagsCollectionViewCell) {
        guard let index = selectedTagsCollectionView.indexPath(for: cell) else {return}
        let item = selectedTags[index.row]
        selectedTags.remove(at: index.row)
        selectedTagsCollectionView.reloadData()
        tagsCollectionView.reloadData()
    }
    
    
}
>>>>>>> 153ee70b49be5472f5d5dc4eac71d302a42c50a0
