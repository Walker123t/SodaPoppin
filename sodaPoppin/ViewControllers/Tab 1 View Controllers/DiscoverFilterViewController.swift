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
    
    var sodas: [String] = ["Mountain Dew","Coke","Sprite","Dr. Pepper","Pepsi","Cream Soda","Lemonade"]
    var syrups: [String] = ["Vanilla","Cherry","Raspberry","Blueberry","Watermelon"]
    var pureés: [String] = ["Raspberry","Cherry","Blackberry","Strawberry"]
    var other: [String] = ["Cream"]
    
    @IBOutlet weak var selectedTagsCollectionView: UICollectionView!
    @IBOutlet weak var tagsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedCategory = sodas
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sodaButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func syrupButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func pureéButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func otherButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func searchButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func poppinButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
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
